require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6007.0.0-darwin-x64.tar.gz"
    sha256 "e9abe73a3c6041ce8a3dab08b61ad533e066a122d429f8ae26833df338aa3bf1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6007.0.0-darwin-arm64.tar.gz"
      sha256 "5a44a120443a8c12bed12e80554621e73a1cb9cf33fc10780ad83adb216889ab"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6007.0.0-linux-x64.tar.gz"
    sha256 "99208ae5a56c9d9e7cc9950373dab7738e6c34a1576eda2a3710ebeb15cadcc1"
  end
  version "6007.0.0"
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
