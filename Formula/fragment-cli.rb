require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.18-darwin-x64.tar.gz"
    sha256 "10ca27b1ff897b8263b54fbe5781bc92938ffef83478c5ce5332539c0677e93d"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.18-darwin-arm64.tar.gz"
      sha256 "18034862ee91c8e80a46d905a36e756f72e72dc69f5de83627431e8d199c781b"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.18-linux-x64.tar.gz"
    sha256 "4cd62c3144534dd27c2dd7927ec3fcd8d292b6a4879c1fc034500a8085e858a7"
  end
  version "2024.11.18"
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
