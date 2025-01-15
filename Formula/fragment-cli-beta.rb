require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6086.0.0-darwin-x64.tar.gz"
    sha256 "59bb51136752af6cae373d75f89f0cfcb9ebcb1e55153fb5bb2bc6d46cb84be6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6086.0.0-darwin-arm64.tar.gz"
      sha256 "19d9e9438a46df0b1dcd4116c781a8887af2602b5510e1c07a5c4a6b5e642363"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6086.0.0-linux-x64.tar.gz"
    sha256 "56234470e374a63122b61d4a60f0260fa258cecfe8535579dd850923b0193031"
  end
  version "6086.0.0"
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
