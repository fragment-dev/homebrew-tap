require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5573.0.0-darwin-x64.tar.gz"
    sha256 "f979070605f0abadcc00e3d820a3fb0844128e2e48b1b305ffc138c1991ecb24"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5573.0.0-darwin-arm64.tar.gz"
      sha256 "67c68a13f12551a835dffe5e24649a2d1e5fb129fef6f415d43938ad7462e2a0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5573.0.0-linux-x64.tar.gz"
    sha256 "d4dd30a3f3e0ad372b2b6dad8bdf28325ba065671027f39beea0db0b37da8ff9"
  end
  version "5573.0.0"
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
