require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3736.0.0-darwin-x64.tar.gz"
    sha256 "ae8722798300366fd9fe21657ff463118cc97fdeb57fd11bf9888e7fada76f6e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3736.0.0-darwin-arm64.tar.gz"
      sha256 "ed8082fb8f6ca07ff9f399f68d9149a58a59620a830aee3e500495275b566075"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3736.0.0-linux-x64.tar.gz"
    sha256 "38646c79c55cb0bd21496e4597301db5a1f2caa1f1f0d949f4f77c192184369a"
  end
  version "3736.0.0"
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
