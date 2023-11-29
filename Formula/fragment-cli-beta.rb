require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4062.0.0-darwin-x64.tar.gz"
    sha256 "c56c6bc7fa52d42fd9186b3bdd0f949379f2970273cc92a02297da77572707e7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4062.0.0-darwin-arm64.tar.gz"
      sha256 "68ee66256af27f68c4b48520aeca07e73d8ee1a331c4ab30b179926785274f52"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4062.0.0-linux-x64.tar.gz"
    sha256 "b50016619863454f3ed6739b0523c35ea7ed36e88cf1055f0542a1a32b5b0fc6"
  end
  version "4062.0.0"
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
