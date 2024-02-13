require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.12-darwin-x64.tar.gz"
    sha256 "d7f2e72ad6eb3e1cf217bf008b236deb39f5d163efbe527bddc4d67b6f98c770"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.12-darwin-arm64.tar.gz"
      sha256 "1ea2e7e90c2d62f6569bad6d6e61d6e13fa128f32e395df10101d8d59d7dc7d9"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.12-linux-x64.tar.gz"
    sha256 "548faa38094aaf86cb46da14823f2b64bad48d2df41e4bdd2f9dac8e5077cd97"
  end
  version "2024.2.12"
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
