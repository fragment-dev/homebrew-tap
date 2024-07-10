require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5374.0.0-darwin-x64.tar.gz"
    sha256 "8a31ce20cfede63d2d375b0c47dbaea29cb33008bc453014726d011fc7fe9cae"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5374.0.0-darwin-arm64.tar.gz"
      sha256 "6cfb838a4aac28398d589fa3b8e213d30d9983b8480c1d7fb2e8686b76081e26"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5374.0.0-linux-x64.tar.gz"
    sha256 "7dcf3e8c63bdc3a10a4e282efec855a64ed123caf820bfe05975649cef3f272c"
  end
  version "5374.0.0"
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
