require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2781.0.0-darwin-x64.tar.gz"
    sha256 "eba0fb16e86db452fa58bc2c78ea58f475646cb8b0a48b18c3a2fcb166c10a52"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2781.0.0-darwin-arm64.tar.gz"
      sha256 "d4b8ef31b36824d8d625569e606351fc7de75237f156d636b41acff05bad3002"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2781.0.0-linux-x64.tar.gz"
    sha256 "4c9a2b3a82b87b8ab573d3cbbced43e0c4fd59e79060bf4dbcaca8a05c7a87b0"
  end
  version "2781.0.0"
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
