# Updated by .github/workflows/update.yml (scripts/formula.sh) from each release of beaver-ops/beaver-cli.
# Placeholder until the first release (v0.0.0, zero checksums): the workflow replaces it.
class Beaver < Formula
  desc "Open the databases you were granted in Beaver Ops with one command"
  homepage "https://github.com/beaver-ops/beaver-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/beaver-ops/beaver-cli/releases/download/v0.0.0/beaver-darwin-arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
    on_intel do
      url "https://github.com/beaver-ops/beaver-cli/releases/download/v0.0.0/beaver-darwin-x64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/beaver-ops/beaver-cli/releases/download/v0.0.0/beaver-linux-arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
    on_intel do
      url "https://github.com/beaver-ops/beaver-cli/releases/download/v0.0.0/beaver-linux-x64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  def install
    bin.install "beaver"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/beaver --version")
  end
end
