require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2814.0.0-darwin-x64.tar.gz"
    sha256 "1fa2bddf6fddce53f6ca9d39145dfe0f854224b14ce4b42e886f54b40bd6aaff"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2814.0.0-darwin-arm64.tar.gz"
      sha256 "d0eaf43041eea51b5baf9ca246203dca2d65357e2d7e3ea5a7c3a242238e463d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2814.0.0-linux-x64.tar.gz"
    sha256 "96a96363ba828a904f28231761739c82ddaf78e093129f2c4d28b84edae46150"
  end
  version "2814.0.0"
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
