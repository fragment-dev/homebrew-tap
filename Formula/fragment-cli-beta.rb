require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4519.0.0-darwin-x64.tar.gz"
    sha256 "a0578d5582daf6ec5c7982bdf27b3c7f8232668a41a2c1c1e9141eafd1fe8dbf"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4519.0.0-darwin-arm64.tar.gz"
      sha256 "9b39db7c25bb1e40308f2d0f45220b9ac30cec51350d8188241e5ddeb3e44e43"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4519.0.0-linux-x64.tar.gz"
    sha256 "ed23f0081969300e79ed7e3e7a400ded5311457abf8d1f4f3f73a2af37ed0cd2"
  end
  version "4519.0.0"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
