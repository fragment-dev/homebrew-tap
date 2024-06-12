require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5260.0.0-darwin-x64.tar.gz"
    sha256 "a2f8782de740d86ffbcc6c1159679159c6d8d9821dbeabdee39f21a2d6f740c4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5260.0.0-darwin-arm64.tar.gz"
      sha256 "bf38f1df4de84acb879cc47932491691b24d41eba159277e7ca2798f776df467"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5260.0.0-linux-x64.tar.gz"
    sha256 "0fd7c0b2cc7ae8d4c76aa7f7aa5b8c2c72a0a552f06851ad9799432201f0fe90"
  end
  version "5260.0.0"
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
