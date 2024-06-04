require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5196.0.0-darwin-x64.tar.gz"
    sha256 "6934a830c87bae389087264e02375a3e4247479f25e5d9c46121d8c730b28603"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5196.0.0-darwin-arm64.tar.gz"
      sha256 "0d4ecfa1e4d714678ec44252965dc4ec1f0d37f7f8090695649f17a09de7dafd"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5196.0.0-linux-x64.tar.gz"
    sha256 "83cc138e213287f26feb37f85c41dbf39d6bd773d048fdd3b08157d71f7447c4"
  end
  version "5196.0.0"
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
