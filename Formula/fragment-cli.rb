require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.14-darwin-x64.tar.gz"
    sha256 "d46e705203703ccec117c8e8b0255e33a7775ef5e903117cd9e588235d049baf"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.14-darwin-arm64.tar.gz"
      sha256 "27f35e390ba33432104a0ee325100175d96888824e201d8ab500fa566c5d542e"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.14-linux-x64.tar.gz"
    sha256 "64cc730058f6cfc1ceb2c8aa43a57f870c1c9becb244d33b6c1fd2bd1aedca9f"
  end
  version "2023.6.14"
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
