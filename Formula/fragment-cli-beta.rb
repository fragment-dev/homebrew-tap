require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4912.0.0-darwin-x64.tar.gz"
    sha256 "abca2cd286581f24c85ee032b5938c651671df7530108e6b3dd666e0b0396e32"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4912.0.0-darwin-arm64.tar.gz"
      sha256 "2c84029220a5d02e455b5bbbd88a0b0cd210517743d2d3d786efbdce9ee4c676"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4912.0.0-linux-x64.tar.gz"
    sha256 "b1e41399efc16306487f9779121d499560e8b9569e8984d98bcf2a9e90d43d03"
  end
  version "4912.0.0"
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
