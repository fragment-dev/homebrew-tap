require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5812.0.0-darwin-x64.tar.gz"
    sha256 "adcd0270b97e92c0ede17cd7334a0b19fd3331dc43a099116e4920c073e920e0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5812.0.0-darwin-arm64.tar.gz"
      sha256 "03bf4aae0e58ac311b40072f1cb31c9d9cc1c99188d23a56a0df636befad4783"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5812.0.0-linux-x64.tar.gz"
    sha256 "c36f53e1d268f8284c68ed7f93f7e0cd08f7f39cc138102320f2f29eeb8350da"
  end
  version "5812.0.0"
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
