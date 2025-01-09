require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6060.0.0-darwin-x64.tar.gz"
    sha256 "a7fd2b0e360c40d2e0a621916bc33a91d85fc0894b440b75d61ef101e1585f77"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6060.0.0-darwin-arm64.tar.gz"
      sha256 "5c7cdc84e4886004a69962a56d51e34307accf077ea4c769df8ab80a66f45836"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6060.0.0-linux-x64.tar.gz"
    sha256 "2aa25f7d605d6c6f40088d37f343ba7736aa8731c634f7703fd799b20a04edc9"
  end
  version "6060.0.0"
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
