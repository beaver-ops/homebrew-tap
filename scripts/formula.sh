#!/usr/bin/env bash
# Writes Formula/beaver.rb for a release of beaver-ops/beaver-cli, from the release's checksums.txt.
# Usage: scripts/formula.sh <version> <checksums.txt> > Formula/beaver.rb
# Used by .github/workflows/update.yml; run it by hand the same way if needed.
set -euo pipefail
version=${1#v}
sums=$2
repo=beaver-ops/beaver-cli
[[ $version =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]] || { echo "not a version: $version" >&2; exit 1; }
sha() {
  local s
  s=$(awk -v f="$1" '$2 == f || $2 == "*" f { print $1 }' "$sums")
  [[ $s =~ ^[0-9a-f]{64}$ ]] || { echo "no sha256 for $1 in $sums" >&2; exit 1; }
  echo "$s"
}
# Here, not inside the heredoc: a missing checksum must stop the script.
mac_arm=$(sha beaver-darwin-arm64.tar.gz)
mac_intel=$(sha beaver-darwin-x64.tar.gz)
linux_arm=$(sha beaver-linux-arm64.tar.gz)
linux_intel=$(sha beaver-linux-x64.tar.gz)
base="https://github.com/$repo/releases/download/v$version"
cat <<RUBY
# Updated by .github/workflows/update.yml (scripts/formula.sh) from each release of $repo.
class Beaver < Formula
  desc "Open the databases you were granted in Beaver Ops with one command"
  homepage "https://github.com/$repo"
  license "MIT"

  on_macos do
    on_arm do
      url "$base/beaver-darwin-arm64.tar.gz"
      sha256 "$mac_arm"
    end
    on_intel do
      url "$base/beaver-darwin-x64.tar.gz"
      sha256 "$mac_intel"
    end
  end

  on_linux do
    on_arm do
      url "$base/beaver-linux-arm64.tar.gz"
      sha256 "$linux_arm"
    end
    on_intel do
      url "$base/beaver-linux-x64.tar.gz"
      sha256 "$linux_intel"
    end
  end

  def install
    bin.install "beaver"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/beaver --version")
  end
end
RUBY
