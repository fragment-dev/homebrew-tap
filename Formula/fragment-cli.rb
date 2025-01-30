require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.30-darwin-x64.tar.gz"
    sha256 "12b6fde726e64b04a562a10c8c7dc7a07b33df6114bbf54d818c81ab81e6922f"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.30-darwin-arm64.tar.gz"
      sha256 "f76b621c6893528a7d2b447d17d9bb941903b272c7b3e18853fa1890b83ebf72"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.30-linux-x64.tar.gz"
    sha256 "63b3c983bd4b9cfa4a5ab4768e445e7398722f0e4e0bc5d24e061db166eb2139"
  end
  version "2025.1.30"
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
