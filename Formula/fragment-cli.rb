require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.1-darwin-x64.tar.gz"
    sha256 "b49fc8fffca6f81c709947fa9d6171d806f654d4ddf84ef7076b0807bc502309"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.1-darwin-arm64.tar.gz"
      sha256 "cc80a32c147c7069e3c81f4373aee99a6a8db1efe3a14e0ea4fd748d8b6193d6"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.1-linux-x64.tar.gz"
    sha256 "3a4ab302ee25df55ccdee1526955b1413507dc7a237f6295fbffc419882bf332"
  end
  version "2024.2.1"
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
