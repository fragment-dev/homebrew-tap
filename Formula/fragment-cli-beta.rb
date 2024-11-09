require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5756.0.0-darwin-x64.tar.gz"
    sha256 "81a77213cdf386482bc36d5de26777ee9669146cc96cbd4ec9cf0d86b4fdd5b0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5756.0.0-darwin-arm64.tar.gz"
      sha256 "d413d99515921afb128f8474d822140c772f877f788ff5dc23f7f6cd9191e8db"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5756.0.0-linux-x64.tar.gz"
    sha256 "2bc0c5a1ca51d5d5110f43d5e451c87092995418602f0b3268583de7ea92e707"
  end
  version "5756.0.0"
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
