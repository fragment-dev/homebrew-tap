require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.13-darwin-x64.tar.gz"
    sha256 "79dcb319c0238f671c165713c6f47613d6d8f1571dba02d3dc9df5f199b46963"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.13-darwin-arm64.tar.gz"
      sha256 "697d4c687d404f1641bd8437b1995e5e696126786d0289e044f38b5f77f56939"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.13-linux-x64.tar.gz"
    sha256 "17792b57f0ffe73d2c1b9c4cdda84af61646c1d5a9af5651114b8f0a8b7d8018"
  end
  version "2023.6.13"
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
