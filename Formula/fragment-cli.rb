require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.29-1-darwin-x64.tar.gz"
    sha256 "0a28a6430b15d4eac0f0a4a7af80653ccb363af5a206e892a69a28cc193d8c60"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.29-1-darwin-arm64.tar.gz"
      sha256 "fd1411fa4fd1d6ec14689adbf0ccd406eb0b777473af1f1331c3aa7816d9bb84"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.29-1-linux-x64.tar.gz"
    sha256 "2dc28abf3577bbffec6d39008c5535975e55ce0e0d572b255af053c1f9f4628b"
  end
  version "2024.2.29-1"
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
