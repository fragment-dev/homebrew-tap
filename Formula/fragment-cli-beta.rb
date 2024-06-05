require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5215.0.0-darwin-x64.tar.gz"
    sha256 "9b94dc858343090b3d6a2610de10f115f2165f59e956e12ba5aa166b96e321df"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5215.0.0-darwin-arm64.tar.gz"
      sha256 "49c5e8c0199046a00e40955d0ee22cf69a0ca06e94c614fd8b53fc25f410e826"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5215.0.0-linux-x64.tar.gz"
    sha256 "6240ee58737b8e5f64935f9bd88aa1004524ba5f83ef352d6fc9848da408ce51"
  end
  version "5215.0.0"
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
