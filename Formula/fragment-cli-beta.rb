require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4913.0.0-darwin-x64.tar.gz"
    sha256 "186313b8f57b6b1db5bdc87baa6ac83cbd010fc52835eed8a5a4a952d14b34b3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4913.0.0-darwin-arm64.tar.gz"
      sha256 "3f226fe6203eb53a0fe8bcdb0909e73542f5d5df663fe5396b1dcbaa78d5bcb3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4913.0.0-linux-x64.tar.gz"
    sha256 "9797f084d9d53fb913ff5a7c9c30cfd796255c687890eef05f03eaf5074aa56c"
  end
  version "4913.0.0"
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
