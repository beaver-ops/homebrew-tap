# Updated by .github/workflows/update.yml (scripts/formula.sh) from each release of beaver-ops/beaver-cli.
class Beaver < Formula
  desc "Open the databases you were granted in Beaver Ops with one command"
  homepage "https://github.com/beaver-ops/beaver-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/beaver-ops/beaver-cli/releases/download/v1.1.0/beaver-darwin-arm64.tar.gz"
      sha256 "752ce80896e25a208ace6da419839e0fcfd5de1d9095a753a4bfdcb896ae8c3b"
    end
    on_intel do
      url "https://github.com/beaver-ops/beaver-cli/releases/download/v1.1.0/beaver-darwin-x64.tar.gz"
      sha256 "9146ef46e0b169a98facd0171f760a0ff2c3080bb701051cf626b7811af0182e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/beaver-ops/beaver-cli/releases/download/v1.1.0/beaver-linux-arm64.tar.gz"
      sha256 "f0650f7d0081f8d4536220aa399a1d651d5d086c2d95de8f9abb4aa3aed11d7b"
    end
    on_intel do
      url "https://github.com/beaver-ops/beaver-cli/releases/download/v1.1.0/beaver-linux-x64.tar.gz"
      sha256 "316efa200ac61f57c3db03df958cfb63f956db18f204a7273763f0fd3dba5bce"
    end
  end

  def install
    bin.install "beaver"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/beaver --version")
  end
end
