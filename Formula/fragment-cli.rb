require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.3.16-darwin-x64.tar.gz"
    sha256 "5a160b2b09e09b389c1b1df06d44cb76338727ed31d0168bd167c2ec5c2914c0"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.3.16-darwin-arm64.tar.gz"
      sha256 "f307df8a42baba4af74153ad34a38633024efb96441e6049f67ff86a1f61a875"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.3.16-linux-x64.tar.gz"
    sha256 "aef1d4c794a69883ee1a058d09853aafbe27a6346ee6ce0c70cf310639c2f1bc"
  end
  version "2023.3.16"
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
