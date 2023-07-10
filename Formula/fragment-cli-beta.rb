require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3021.0.0-darwin-x64.tar.gz"
    sha256 "adf7a07c5f818312205efbd6b0395903caca1dc225ccf2cdd363822326465c64"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3021.0.0-darwin-arm64.tar.gz"
      sha256 "473d6feda888270bb71d78b089be0fd5d24bdaa3629fc4970007c6ce6acabd45"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3021.0.0-linux-x64.tar.gz"
    sha256 "ad2c16e04dc1c164dc8a7a03fb714104c579a0ca33cd3119db41b8bd01733a9c"
  end
  version "3021.0.0"
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
