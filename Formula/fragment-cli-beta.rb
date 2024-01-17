require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4352.0.0-darwin-x64.tar.gz"
    sha256 "eaf398cb28bde5ab959cf7d5f4c3766dcc34578ea7ec6d6635ffea5c96b795b4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4352.0.0-darwin-arm64.tar.gz"
      sha256 "1638607554f394c6aba8f52933e7e0ed9997ef9e3ebac18e4a028495773e97f4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4352.0.0-linux-x64.tar.gz"
    sha256 "2169f7d99619f55cae90cfc2a35827f2d278761b171fe4948b6b68bf3bf3f010"
  end
  version "4352.0.0"
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
