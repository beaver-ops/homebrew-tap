# Updated by .github/workflows/update.yml (scripts/formula.sh) from each release of beaver-ops/beaver-cli.
class Beaver < Formula
  desc "Open the databases you were granted in Beaver Ops with one command"
  homepage "https://github.com/beaver-ops/beaver-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/beaver-ops/beaver-cli/releases/download/v1.0.0/beaver-darwin-arm64.tar.gz"
      sha256 "ee080e266aa9da7276541c5220db8be9c4ae9a4336137409a08b973c003e5561"
    end
    on_intel do
      url "https://github.com/beaver-ops/beaver-cli/releases/download/v1.0.0/beaver-darwin-x64.tar.gz"
      sha256 "1f75df789f2d3b2bd84c3a05c601e292f03adda16ef7670e6f998d2789edd114"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/beaver-ops/beaver-cli/releases/download/v1.0.0/beaver-linux-arm64.tar.gz"
      sha256 "d8f83dadb4968de2916f1b463770d16e5fd377db5a8965525574ce3f5c2cfa53"
    end
    on_intel do
      url "https://github.com/beaver-ops/beaver-cli/releases/download/v1.0.0/beaver-linux-x64.tar.gz"
      sha256 "82b3906ce28b155a7ddb1bcb8afa6971d0b5e5952078cfe5258c1be56aa73a4a"
    end
  end

  def install
    bin.install "beaver"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/beaver --version")
  end
end
