require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5351.0.0-darwin-x64.tar.gz"
    sha256 "16ce2b7dae7656e1e9a43bd701745069f2ae96271ec4b17e5481612f866b1f2b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5351.0.0-darwin-arm64.tar.gz"
      sha256 "0040735f5d755b056d7884b38a3301deef8463f5e7911e6e6e691d3d92c97b64"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5351.0.0-linux-x64.tar.gz"
    sha256 "33c884e6f8caeea6597481c3b51af6c49ad385dfc9764571682430b075f579cf"
  end
  version "5351.0.0"
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
