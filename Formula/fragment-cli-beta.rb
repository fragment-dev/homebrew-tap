require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3163.0.0-darwin-x64.tar.gz"
    sha256 "a5ef2804daba10aad5a87b1fce0b0ddca665ccaf542f3888529a93cee33d57c9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3163.0.0-darwin-arm64.tar.gz"
      sha256 "5625b1c84bafbe7b18d7b2625d69bf208b154740cfaa871f8ca84be8b6454744"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3163.0.0-linux-x64.tar.gz"
    sha256 "c1a6f219d7a33a3715f257944ff19a686662f39d7ae66fff83469db36cf2486f"
  end
  version "3163.0.0"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
