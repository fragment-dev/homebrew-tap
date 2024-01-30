require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4460.0.0-darwin-x64.tar.gz"
    sha256 "9fe5594832493aaa3a68f66ea20541dbdc059bbddad6a8a4b0d9a74a022d8b63"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4460.0.0-darwin-arm64.tar.gz"
      sha256 "af8fa2aa9741eba6f9207302432cddfcb6d3ffb0e68fb672211fe5ee3db5eada"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4460.0.0-linux-x64.tar.gz"
    sha256 "7ab1d1bc1bc5d4b7ffcbcd746c1737afb52d2aae085813d2e8d677988ae1b1e3"
  end
  version "4460.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
