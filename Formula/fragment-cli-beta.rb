require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4674.0.0-darwin-x64.tar.gz"
    sha256 "d3b2e93b7562522419b4f59b2627d0b796a8b8d238c8dea0437daea6d6f7ed4b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4674.0.0-darwin-arm64.tar.gz"
      sha256 "33ce8ab34faea1786abf5ecf36cad791d0bf7d8c83a98237a41ae62d590bb603"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4674.0.0-linux-x64.tar.gz"
    sha256 "6eef89157f7dec01bfff3d1bf4ee49c82159d22f2c9045a10c4ebcacef63021e"
  end
  version "4674.0.0"
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
