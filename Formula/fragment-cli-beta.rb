require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3354.0.0-darwin-x64.tar.gz"
    sha256 "d51933dc7bd13769bd438bf310a7f00b81014be32eed257af802612176536800"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3354.0.0-darwin-arm64.tar.gz"
      sha256 "7c729c333cfb639fb5bee2778797222f5ff4f5066ccb2a6fbe62d207490a1d7e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3354.0.0-linux-x64.tar.gz"
    sha256 "639b72633148229ae5c432b1631c89e19996ac3f35f342b30534fbd597d5735d"
  end
  version "3354.0.0"
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
