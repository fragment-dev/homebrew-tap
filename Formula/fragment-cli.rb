require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.29-darwin-x64.tar.gz"
    sha256 "2cf16d76f09bea7b21831daa5662b4fbaef73a466f587ae58d8a84086cb84103"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.29-darwin-arm64.tar.gz"
      sha256 "1ed923ee70cb601ceea9b328c39fab438211a2f1b46b4d648dfc3c794eb47f0c"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.29-linux-x64.tar.gz"
    sha256 "6769e50e3557739adf8939dfb0201d5742765375fdc024006062bafc6e6356ee"
  end
  version "2023.9.29"
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
