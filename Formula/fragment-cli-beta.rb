require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5704.0.0-darwin-x64.tar.gz"
    sha256 "68714a58b3c47ef175709d1e181044f74eef76619454886a6d1c6c0f9610ad4d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5704.0.0-darwin-arm64.tar.gz"
      sha256 "7a97ccab4f3ad24695aaeb45279187727e190ea436c897fd8c9bdf5bdbd8ddfe"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5704.0.0-linux-x64.tar.gz"
    sha256 "8dacd52bda44aebc961428e213f7c07fe7c5c08cbd10400be6736ddf7dbaa20b"
  end
  version "5704.0.0"
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
