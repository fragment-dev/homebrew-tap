require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3984.0.0-darwin-x64.tar.gz"
    sha256 "f301db60b208548f85fe7fa6bcd71c7ee77603bc5ddf41654ca176c409ccdded"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3984.0.0-darwin-arm64.tar.gz"
      sha256 "7b9ceba48f29962ecfb0b4aff1caf5f5b246b952b1220d32fcc5d07bfb2ca680"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3984.0.0-linux-x64.tar.gz"
    sha256 "7eca870222fde0c1fc43a2e0e0fc986a94ac8dc1b2c9636536d555c0c9097043"
  end
  version "3984.0.0"
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
