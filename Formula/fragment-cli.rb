require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.15-1-darwin-x64.tar.gz"
    sha256 "e314640937a6b46ee8a178a7772e090d369552c3f30cc3db1b4ae1837412f369"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.15-1-darwin-arm64.tar.gz"
      sha256 "615d625d4706983f54b087c9c3d5ab57ed48d8588776c200ebdc7062be6dc12d"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.15-1-linux-x64.tar.gz"
    sha256 "74f575cba285a86c0df90b67b3d6be0a194d14c7046256df9f6d2bc78e18bf1d"
  end
  version "2024.3.15-1"
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
