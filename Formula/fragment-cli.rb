require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.19-1-darwin-x64.tar.gz"
    sha256 "1dc848851fbcdde4aa3643bb3cbc14d4fb3dbbdcc2e64d743ec570b2c0a2c494"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.19-1-darwin-arm64.tar.gz"
      sha256 "181507573d8b12bb17bf8c6e2811c97bc0ee8994a03a5131e779375166a6b5cf"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.19-1-linux-x64.tar.gz"
    sha256 "fdb4abee77d343369eefbf08ed7b4761b771d3e071c46d8446285d0cddc4a015"
  end
  version "2024.2.19-1"
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
