require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.12-1-darwin-x64.tar.gz"
    sha256 "7677130d5db26720f391021e1d8853837dbce7882303dbf4bbd47627012e8b74"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.12-1-darwin-arm64.tar.gz"
      sha256 "e9fdc46e3b1bcf41c10fe40eb3187f2f155ee1caa03e8aace6d4ae9b6874c997"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.12-1-linux-x64.tar.gz"
    sha256 "8153d900fbc5c29d95cb43e93bdec857a5cb17b4894b0b449dcff9d402f4d039"
  end
  version "2023.10.12-1"
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
