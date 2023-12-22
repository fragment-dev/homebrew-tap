require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4203.0.0-darwin-x64.tar.gz"
    sha256 "18a4311b34b4d46845aa600a92a38f7b88120f8913a7074e322900296f303cf1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4203.0.0-darwin-arm64.tar.gz"
      sha256 "11409bbe131cfeabee9d251926a966cf720ebe5dd9428fd29dc11450db584d63"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4203.0.0-linux-x64.tar.gz"
    sha256 "5ba72d5ca56c8ff549fcffa46580656a552c523d7b296daa16c537cab21c30c5"
  end
  version "4203.0.0"
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
