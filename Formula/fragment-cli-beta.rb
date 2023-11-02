require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3963.0.0-darwin-x64.tar.gz"
    sha256 "08749e09329c6fb94480fd07deb181595bae088d882c98cffa467fbfcdd9f3f9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3963.0.0-darwin-arm64.tar.gz"
      sha256 "6bd0b5482ad83ecb4a0e3b3a1d6e5982d445c961d6e8fcd1c321c6f546833c3b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3963.0.0-linux-x64.tar.gz"
    sha256 "37c86face241fa033f28f10179d3fad36f611c97475a3c646c7e19ad3a86460b"
  end
  version "3963.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
