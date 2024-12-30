require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5999.0.0-darwin-x64.tar.gz"
    sha256 "7257e2bea04ad419d61241812eb7f0a252bf3b7be286141a7a95ccd5cad8ca52"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5999.0.0-darwin-arm64.tar.gz"
      sha256 "eea93e70db82138f99014788f8b606cb6a0ec038cc43301d5f51421ec14b2d2d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5999.0.0-linux-x64.tar.gz"
    sha256 "ab3e2029579008fbfa570224347f319d6259acc1c2930e76496dbd4ac9af1f88"
  end
  version "5999.0.0"
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
