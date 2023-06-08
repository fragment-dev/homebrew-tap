require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.8-1-darwin-x64.tar.gz"
    sha256 "07396754816afe7968d4b28516ced0b76798003231a807bfb648adbb1fee686b"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.8-1-darwin-arm64.tar.gz"
      sha256 "3081fd87fa2d7e6c78d56092748f01199577c63a94f8c5234d13125f3d477e76"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.8-1-linux-x64.tar.gz"
    sha256 "5ab0014736a1bb6c632baa99e617a90b013c4cc43e4bb12af5b28f8e03e0f7e4"
  end
  version "2023.6.8-1"
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
