require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.8-darwin-x64.tar.gz"
    sha256 "17b8b2024edfbbd30506fd042702e35a8d83bcaabb9d048cb542d4cb0dfcbcf2"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.8-darwin-arm64.tar.gz"
      sha256 "600693946936ff134efa6b0c83e146416c32dc243018353856a8e153827eff71"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.8-linux-x64.tar.gz"
    sha256 "e10a519e3c54546155c9de3b975cdc57c79e32a81f6aaa0505f0c1f8a0e8b8cb"
  end
  version "2024.11.8"
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
