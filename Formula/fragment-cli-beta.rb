require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3274.0.0-darwin-x64.tar.gz"
    sha256 "cd8d5d9731c35850829f4dee152c9bc4c210c889fdd66275aa7080318d6429c5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3274.0.0-darwin-arm64.tar.gz"
      sha256 "7eedf6f40a95bb0bbe2d3d38ec53cfa41cde3b3cf6270a6fd011e00aedfad37a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3274.0.0-linux-x64.tar.gz"
    sha256 "eb89ec804b3ebb65115e13bd40a09c29fe32db6cfc7d2d630c82174739c9ed98"
  end
  version "3274.0.0"
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
