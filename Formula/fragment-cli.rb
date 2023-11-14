require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.11.13-darwin-x64.tar.gz"
    sha256 "3cba345096623a8771884e6071a6a021eab7e540f76598f218426af63d9c0096"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.11.13-darwin-arm64.tar.gz"
      sha256 "fd44ff64701c042e4b5a45678e1c51fd3d73c4d7ca87742433d4e093407e4a76"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.11.13-linux-x64.tar.gz"
    sha256 "4d8f8278dbfe441f65ee0fa5a49dc191adf6c5bc026cbed6145b584e53c3e2ac"
  end
  version "2023.11.13"
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
