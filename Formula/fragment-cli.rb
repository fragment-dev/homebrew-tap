require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.9-darwin-x64.tar.gz"
    sha256 "247f79ffa67d7b1bbda4d5c649e5e739884d49f6e7b0944727d9e9ae13e93289"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.9-darwin-arm64.tar.gz"
      sha256 "4e3d1dc7cf1a1aaec2115587deede0a8fbbc126cb7e03c4e4f2bb983d39c89e3"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.9-linux-x64.tar.gz"
    sha256 "df6ecf5cc41a3364bcf8118168e23eb477b8be235ef386c555c6f8583729eedf"
  end
  version "2024.12.9"
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
