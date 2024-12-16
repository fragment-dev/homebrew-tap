require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.16-darwin-x64.tar.gz"
    sha256 "c10be560ff3c19f80cb05895ebfd73f107f0fe8d3523e8f771cf5c0570e5aaae"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.16-darwin-arm64.tar.gz"
      sha256 "99e857c43a1fbe02b28a0b0138259768b4b861cb1d4498a25a0fef92b0ee04ed"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.16-linux-x64.tar.gz"
    sha256 "dcc8da8f325f0e27f55fe3dedb91562626bc1d0e0e9f5ae5c4231920e413f865"
  end
  version "2024.12.16"
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
