require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5494.0.0-darwin-x64.tar.gz"
    sha256 "884e438fbdcf6c701f10aa27408c8c1291722ab3ee2f5af43bc36dcde803bfdc"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5494.0.0-darwin-arm64.tar.gz"
      sha256 "81dbdaf529cab9352b0b7f7837853eecfcb49fb20bd4275b6084abe58c13d764"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5494.0.0-linux-x64.tar.gz"
    sha256 "a2b55e29badda6e40bca400938f4dd33b1bdbb043a04a32375ee4d24c6d2ee77"
  end
  version "5494.0.0"
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
