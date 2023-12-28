require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4231.0.0-darwin-x64.tar.gz"
    sha256 "a810689246de6a19626525dfd1317c0c75d66834ba23cd600e7f0528f56c9805"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4231.0.0-darwin-arm64.tar.gz"
      sha256 "a2ce758f04adced107ecdb257fbf77fd8d4aab2bb40f89ebb330fa9e7570e5e9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4231.0.0-linux-x64.tar.gz"
    sha256 "b75138802bdc09a84fa0021ae158f45c5ad9595be1e22c2ceb86139155c5a44c"
  end
  version "4231.0.0"
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
