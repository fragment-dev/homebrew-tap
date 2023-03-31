require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.3.31-darwin-x64.tar.gz"
    sha256 "3548a599a613dd057732907f510ac85de0297123010d1ff2a0ba1e74f5c8b762"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.3.31-darwin-arm64.tar.gz"
      sha256 "4f50b1bf7e415b1d7bcf4e28025e001dcb05fad2604e7140655c83da8b5cef08"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.3.31-linux-x64.tar.gz"
    sha256 "37243f1d721704ab4f529f3b0dcebf8aa3faac8ef22649e778ad59fa7c2aecfa"
  end
  version "2023.3.31"
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
