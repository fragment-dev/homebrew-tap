require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3426.0.0-darwin-x64.tar.gz"
    sha256 "1e4231ae6d6e16b17984b4d6f568f718eb639b9e60f54e89d3acf24e90eabf1f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3426.0.0-darwin-arm64.tar.gz"
      sha256 "1bd01253668882fe85e3112f790af23161aa7ba15e300f5e7215bf15fdc9ff76"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3426.0.0-linux-x64.tar.gz"
    sha256 "8c9ab8c6a12f1afeb8889aa0b12b4b8172c96fe2c8bb4a9530491f3a0eb857a0"
  end
  version "3426.0.0"
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
