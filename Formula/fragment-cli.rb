require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.16-1-darwin-x64.tar.gz"
    sha256 "82540cfa76797df063bcea2f67847da7d4f1f0162bb394f42dfd59112832a5c2"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.16-1-darwin-arm64.tar.gz"
      sha256 "b8abe8c25f66303dcbb1fc456fb78a6f956e8f9a9436654354d063b8dc6ddf54"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.16-1-linux-x64.tar.gz"
    sha256 "5ad3e992b565aa6bef196f46f087e5a9152d2cf00eeb6d71f19bbc4a1a3f6bfb"
  end
  version "2024.4.16-1"
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
