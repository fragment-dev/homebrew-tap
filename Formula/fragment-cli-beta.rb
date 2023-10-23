require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3880.0.0-darwin-x64.tar.gz"
    sha256 "982228936db765dbb1acec3095c81e161d6a0a31132f4acf4d4bb5d3b52be055"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3880.0.0-darwin-arm64.tar.gz"
      sha256 "5ad5070db39d2678a817fdcae76e1036956e363af97a10bf93f6a74fd53e4abe"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3880.0.0-linux-x64.tar.gz"
    sha256 "7c1df821e0bb8beacca237734d5c6f91ceaf9d23472572d5fbd5a179a979b002"
  end
  version "3880.0.0"
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
