require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.15-1-darwin-x64.tar.gz"
    sha256 "4732422791f2ced2a76ae6f1ff44290a7a52b17036e99ffc823c4dd34a20917b"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.15-1-darwin-arm64.tar.gz"
      sha256 "b336ab3a0a84972b7d6454fb6913a41b97ff3cda373917f250174e664738d51b"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.15-1-linux-x64.tar.gz"
    sha256 "a8deb704ab2451c284d8b9846e2cb1633c88ffb3ac20e1dabed75b1d5747d7db"
  end
  version "2023.6.15-1"
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
