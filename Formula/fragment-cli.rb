require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.3-1-darwin-x64.tar.gz"
    sha256 "deb71a7b5d15ab70687f490770f413b86ea907cf853904ed0224c4b452cba92c"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.3-1-darwin-arm64.tar.gz"
      sha256 "72f52352659f2cadd4953ce46a18d4938882db1809893070d5415f8d5d3f7199"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.3-1-linux-x64.tar.gz"
    sha256 "a82c4b10782a17e5ea24a0ff7f5ea07299bdf98ae6d38b9a2d7de9a32e4d5ecc"
  end
  version "2024.1.3-1"
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
