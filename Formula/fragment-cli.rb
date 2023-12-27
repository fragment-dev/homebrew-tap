require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.27-1-darwin-x64.tar.gz"
    sha256 "7d52fb395f426f61ee8c811e81ef4b751f23c1b7353f67906f3cc2664e27a21e"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.27-1-darwin-arm64.tar.gz"
      sha256 "c11ebbec199775c892ed2fc539b2b0027a4ecdb9709e85d81877b80e4dafa44a"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.27-1-linux-x64.tar.gz"
    sha256 "0321695755ed7cb401d1f99292e5bd1dbca1252de8ada5ef10fa3b7b8ec030bc"
  end
  version "2023.12.27-1"
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
