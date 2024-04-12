require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4888.0.0-darwin-x64.tar.gz"
    sha256 "e4834746d5dcd4b3f37e887a67cb4a44ba15b900d9e1f0f5eec497c73f320275"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4888.0.0-darwin-arm64.tar.gz"
      sha256 "7d4735c0ac8e00cc4cc1cad3ca8ecb2288e2d799d5b08bad4fde289b0c7b7aa9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4888.0.0-linux-x64.tar.gz"
    sha256 "805690e66e203de36cfffe4ac18e59d2a7995eefd23a98178403f74d701f124d"
  end
  version "4888.0.0"
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
