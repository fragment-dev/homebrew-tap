require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.21-darwin-x64.tar.gz"
    sha256 "3ff5efc913ded02c6ba07438578a1a775b4a22e616762b8051488728e68699db"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.21-darwin-arm64.tar.gz"
      sha256 "860514864756ea887e7a91af679d84fc332e9c65bc80ef9cf2e6d2c35f9795d5"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.21-linux-x64.tar.gz"
    sha256 "3c6d630b79f45071ac7b1e123e03868333df34bac64616dc227e734c93ea2feb"
  end
  version "2024.10.21"
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
