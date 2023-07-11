require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3028.0.0-darwin-x64.tar.gz"
    sha256 "a4e4f10f730b0d76dd096f96f8ce0fb6ffbaae4bd3be00c9b0cdbdf2503721ad"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3028.0.0-darwin-arm64.tar.gz"
      sha256 "16cf21fae6b255f5bc03304961440e5a92bad8290b051e122a7b01d0dda58643"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3028.0.0-linux-x64.tar.gz"
    sha256 "c2c77b6f9329bf7dcca621f670004d24e96a5de308d7d4612f0b84c9633b9b0a"
  end
  version "3028.0.0"
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
