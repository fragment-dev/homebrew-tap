require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.2-darwin-x64.tar.gz"
    sha256 "e9d94b50a42fd3b62592a18bb6de0debb2173e7b2a54d2a605b5ab654b2a590f"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.2-darwin-arm64.tar.gz"
      sha256 "e3e5678050362be2b1a4ff5c0cafa99d01635cdf7456d6617ea0afd78d489a16"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.2-linux-x64.tar.gz"
    sha256 "cec72fdb87ca89511326bd31d27fea234149c5e3fb07fba718e1279494dda671"
  end
  version "2023.6.2"
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
