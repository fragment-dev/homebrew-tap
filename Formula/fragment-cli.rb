require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.13-1-darwin-x64.tar.gz"
    sha256 "1b3e8b10d7d69b9fd4f46c720ec4e8cb120ef304e71336bccfbed4fd881fec4a"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.13-1-darwin-arm64.tar.gz"
      sha256 "4f45eb57b51fe86b5cc68bf583960a2e06fd9ec6356af0b8b65ce1720781e1d4"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.13-1-linux-x64.tar.gz"
    sha256 "00a612e9375a8ab5c345771836d209d8a8e39e3695b2bc069567d059adeefaa9"
  end
  version "2024.11.13-1"
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
