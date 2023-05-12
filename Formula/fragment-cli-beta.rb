require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2645.0.0-darwin-x64.tar.gz"
    sha256 "13cdc330d8d2c1c2d24e7fd135653b28c66f0c60969a749976ab45a3268f07bd"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2645.0.0-darwin-arm64.tar.gz"
      sha256 "248ad661d82c1312e54da0faab0f09a28d5697e403ed9b5ac91a7e9430a0417e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2645.0.0-linux-x64.tar.gz"
    sha256 "b401fc1cc3cb3a314e034dbabea559c745788f80aef9c474be9bd83cb8776e03"
  end
  version "2645.0.0"
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
