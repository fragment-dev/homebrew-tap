require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4881.0.0-darwin-x64.tar.gz"
    sha256 "b398223d3e69b2aa8342d48f6297eb0d43f88714c0e7beef226a2d78462559da"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4881.0.0-darwin-arm64.tar.gz"
      sha256 "6f799ce07ffdd1bbb15478fa6d4b3aa96d680e1a679c7699e8a6593fe46daf95"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4881.0.0-linux-x64.tar.gz"
    sha256 "be9a1a57e1352bbfe28fbd3d0d77d24f0e08fba36feebe27dec7992097185b4c"
  end
  version "4881.0.0"
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
