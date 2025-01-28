require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6131.0.0-darwin-x64.tar.gz"
    sha256 "96f18aa70355861807a236474f4220f03ee6c193ee2870233e95e554f594cb88"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6131.0.0-darwin-arm64.tar.gz"
      sha256 "c56c447a60ed63de5abcf690cb0402690ee3c4ebd507ba0e70629efc4be60022"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6131.0.0-linux-x64.tar.gz"
    sha256 "7c48369f6533c67c1be35bb6f56f6f96e8a1fc842ce250baa2b81f2f6733684d"
  end
  version "6131.0.0"
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
