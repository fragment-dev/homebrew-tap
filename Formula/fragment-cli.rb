require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.30-darwin-x64.tar.gz"
    sha256 "3c65b3a90ab09973c762052dc830de804f96d936be0352b1508fd569537f1ba1"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.30-darwin-arm64.tar.gz"
      sha256 "46e9bcf8b6272bcae007a7e71f9ea9175989c8c499adc1430f588a8b06b222fe"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.30-linux-x64.tar.gz"
    sha256 "f0362cae1764748234048e77f92a8481bf187ea6bf112ffd23cbeef47a775c79"
  end
  version "2024.1.30"
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
