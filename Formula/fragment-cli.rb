require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.29-darwin-x64.tar.gz"
    sha256 "41be52b569ebd5014329349cfcd64c51bd5b6e2061c11e620b3ec218f502a47e"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.29-darwin-arm64.tar.gz"
      sha256 "91ff51afccc89414e75bd130d74f79690b219b5029d2cc8fc3b2cf2c88ac45c4"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.29-linux-x64.tar.gz"
    sha256 "e83260cf0bd6fc5c8e00af713e8d0bd547b0fae0ad2e96939ae0ebf737d8a819"
  end
  version "2023.12.29"
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
