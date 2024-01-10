require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4309.0.0-darwin-x64.tar.gz"
    sha256 "93227c111cef6c2ffa095e60fa6f55ff6c8ed749316bebf0f02b9685a128b8a0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4309.0.0-darwin-arm64.tar.gz"
      sha256 "405ed5cea7847f4b5d5f3ccb1e6890a9704346372c156a110be024bafc3346c3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4309.0.0-linux-x64.tar.gz"
    sha256 "8da1f71a28f94d76cef02d3950e2b83519087954e73a5c73d4563f83d31dfca2"
  end
  version "4309.0.0"
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
