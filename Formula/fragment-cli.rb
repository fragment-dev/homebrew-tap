require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.15-darwin-x64.tar.gz"
    sha256 "f3d00c87eb96b15e31cd4da42643ecbc355160dc407505bdebea7d6d626244a3"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.15-darwin-arm64.tar.gz"
      sha256 "6031f821ec1efa632d0e7f07874cdded1078f8be0601f5c80fceca29beb52ae9"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.15-linux-x64.tar.gz"
    sha256 "75a4f664f2cc14719915bcb65690df2fd68b10f619ab4d8d81ba9b643491d9ca"
  end
  version "2024.8.15"
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
