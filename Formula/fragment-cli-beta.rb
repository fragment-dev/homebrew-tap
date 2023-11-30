require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4076.0.0-darwin-x64.tar.gz"
    sha256 "358f8f4d6c92aa436baffd7a413939edf3fc6889762d6b0549120d729050b5ff"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4076.0.0-darwin-arm64.tar.gz"
      sha256 "40bf4c231f85592005a96770458e8e9f0329278116540302a05b729eaddc235c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4076.0.0-linux-x64.tar.gz"
    sha256 "a058d70d49821232bff12b0e529380e0f4f7aa7ab00bc486bd57d47d7b5a1c8a"
  end
  version "4076.0.0"
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
