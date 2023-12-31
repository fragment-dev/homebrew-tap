require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4240.0.0-darwin-x64.tar.gz"
    sha256 "ba1f62d7bff40346f106a7d70c79972dd20168502b1ff4cbd703a60d279cdcb1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4240.0.0-darwin-arm64.tar.gz"
      sha256 "75894f667f65b2da28e12b209bdd74f4f0d93f6ea23ff6e9535548bc9743e79d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4240.0.0-linux-x64.tar.gz"
    sha256 "04d9ec8b4e7bca37503f121f95ef5e04ff2c8831202d6288a6cd98844cfdfe98"
  end
  version "4240.0.0"
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
