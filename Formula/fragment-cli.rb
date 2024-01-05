require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.5-1-darwin-x64.tar.gz"
    sha256 "e1709c7a957ded37765ff7fd6253f7ca650d66ae67021acfcdab9f6843dd5a0f"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.5-1-darwin-arm64.tar.gz"
      sha256 "739c17b1b9c68eed195244c6a1d41943dbd596dcd637f8b2be9608a98fd6ade3"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.5-1-linux-x64.tar.gz"
    sha256 "f9d8f8ce1677b6ffd30a1c0e16a1d6c6e808db1ff721e614ce8c23896c59fc9f"
  end
  version "2024.1.5-1"
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
