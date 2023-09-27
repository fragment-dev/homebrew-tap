require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.27-1-darwin-x64.tar.gz"
    sha256 "b155858093bcb8cbee73c3896dcc7efd442ec4d8b7a22ac3ba2e1c5b4583538b"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.27-1-darwin-arm64.tar.gz"
      sha256 "c3700af8c1d7789e43839d148d66fa1434889f144df9b4681a3c2218836db300"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.27-1-linux-x64.tar.gz"
    sha256 "8f7705ed3cfcd23c7032dd904b89295b973bba86b05a4e0f315f97c89c767598"
  end
  version "2023.9.27-1"
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
