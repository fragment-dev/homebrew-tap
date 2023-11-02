require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.11.2-darwin-x64.tar.gz"
    sha256 "0752fce3364a1c8564044830bdf8d9f07030ed649a5132a26e5c1d1fd6763853"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.11.2-darwin-arm64.tar.gz"
      sha256 "e3917d3fe671e3f53a54239582ea579b0c24ec577c6af9c41dcb2cac0a953a1d"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.11.2-linux-x64.tar.gz"
    sha256 "9aaefe65c88a667cd4c0ac81acd75b83caeff72de9b1d98984d6369f23841420"
  end
  version "2023.11.2"
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
