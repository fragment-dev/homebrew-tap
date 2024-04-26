require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.26-darwin-x64.tar.gz"
    sha256 "55ab8d099e5243f6eb75d2be293f5f548a2d0766753dca62e41434303b74309a"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.26-darwin-arm64.tar.gz"
      sha256 "8ecc48b98c6605984c0213ec61cd056084afd8428be23a60a2f2857ee6363533"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.26-linux-x64.tar.gz"
    sha256 "0cc36ffc3305f07bc547d8996331b48bdd4b15a44d7fec8eb4d48c8e4bbb4006"
  end
  version "2024.4.26"
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
