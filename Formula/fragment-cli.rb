require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.5-darwin-x64.tar.gz"
    sha256 "5ee738322ab6c924703c2c26c1abc181f53df211db1719e0bdb03674139aa5a7"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.5-darwin-arm64.tar.gz"
      sha256 "5ceaeb462c7910d8746a2d30425bb53a02ffdb9ac9cb8c3145a9d47eb023ce8a"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.5-linux-x64.tar.gz"
    sha256 "b73b2fff7d98b36104437a7f0807372c65797b09ab9cbdedcd00ac8d10c74742"
  end
  version "2023.8.5"
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
