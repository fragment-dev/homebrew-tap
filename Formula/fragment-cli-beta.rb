require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6010.0.0-darwin-x64.tar.gz"
    sha256 "3f59de2d0f82933090425fe43efe8db5695bfb1f7fd4adcd08f77e83780258cb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6010.0.0-darwin-arm64.tar.gz"
      sha256 "d87b76defb15aa9d4be88a3a85b21df164aaf84f3e1c3560b43fca516a360ba5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6010.0.0-linux-x64.tar.gz"
    sha256 "e9afa554c68751048131b7ebf736ee23bba4abd7da372b742a518ec51d87988a"
  end
  version "6010.0.0"
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
