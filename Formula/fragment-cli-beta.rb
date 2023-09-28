require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3693.0.0-darwin-x64.tar.gz"
    sha256 "a2256f4bdb66ae570359694cf1a9d7b8cb7fcb6059b3c52d68ce0d9b1952416a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3693.0.0-darwin-arm64.tar.gz"
      sha256 "e181a3a91d4c81a171c68b143d12576399a594219ebc10c0ee900d2e323f5bc0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3693.0.0-linux-x64.tar.gz"
    sha256 "a7504421b2e53e2a5146824f2432c71974169761a7eb581ad62eaccea66a97f9"
  end
  version "3693.0.0"
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
