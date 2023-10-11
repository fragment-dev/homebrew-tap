require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3800.0.0-darwin-x64.tar.gz"
    sha256 "fadeff0d898ad4cffbb6f25d2f44ea17aa204d4cf99d92d4269f1e4f6b832cfb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3800.0.0-darwin-arm64.tar.gz"
      sha256 "abde1aebd759371066ea98a92a81c0cd9908273ed214986c78d0b4539d512b65"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3800.0.0-linux-x64.tar.gz"
    sha256 "6a8ebf58395aa58c416fd631e0471f70a54a8479c0204abe624a38129a979f00"
  end
  version "3800.0.0"
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
