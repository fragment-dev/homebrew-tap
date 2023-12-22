require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.22-darwin-x64.tar.gz"
    sha256 "f5733af1644c3dad4482c68c06b56a70352c8a81094ca695c08c7a6e53b125cf"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.22-darwin-arm64.tar.gz"
      sha256 "72137948a534e02ddf0af1bc236b0a12006a2e9311f2e86eb56b950e26ad6ea8"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.22-linux-x64.tar.gz"
    sha256 "fda7dd2216d12f158af1ac3ca9a1035aa2c3923a2d5c64c3587847f2773128a3"
  end
  version "2023.12.22"
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
