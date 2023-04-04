require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2355.0.0-darwin-x64.tar.gz"
    sha256 "ade34eb99da0a09b94cd40ee3c93666cb8efff0e274e6a7c2fce6a50603454ca"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2355.0.0-darwin-arm64.tar.gz"
      sha256 "e56db885914db01d13339f94bef415ff1b54fb73b11d3fb7fbfbb2c92eb2d057"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2355.0.0-linux-x64.tar.gz"
    sha256 "879a17d3444d3f3544a0dce1d69a4f6d5f5bc5879c42faa6b4775af73a67f6a5"
  end
  version "2355.0.0"
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
