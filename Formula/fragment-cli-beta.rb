require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2528.0.0-darwin-x64.tar.gz"
    sha256 "d130328abdafe46086e3025cf7025108a49dcb37c5bbe9774ec7db42176a6c6d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2528.0.0-darwin-arm64.tar.gz"
      sha256 "c27fb97eec1d5bbf27c9df6a7c03507b0dde75b37839f375dd333afe8cca02ef"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2528.0.0-linux-x64.tar.gz"
    sha256 "58d3b978de7b6ae4b099e0f99ca707e78e2486960a4440ab76166808f846be24"
  end
  version "2528.0.0"
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
