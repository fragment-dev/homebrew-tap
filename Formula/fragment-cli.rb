require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.3-darwin-x64.tar.gz"
    sha256 "275257e6500d2a737a091d3d0528668bd5b5b583ad133992375b40639bece37c"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.3-darwin-arm64.tar.gz"
      sha256 "d949360bb8f141470d984b1264dbf518daf27b89f42054c62973f2d683a28a20"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.3-linux-x64.tar.gz"
    sha256 "d48aa4dda83a8a018d8a5a7e9bcdb60257edcb2aaa0dff0bd775f9921c230bf1"
  end
  version "2024.6.3"
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
