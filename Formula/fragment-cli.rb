require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.12-1-darwin-x64.tar.gz"
    sha256 "bb5c1c26a68f7a4b45c081028e741f621631783d9a2d49e0087b8724142159c1"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.12-1-darwin-arm64.tar.gz"
      sha256 "908e501d081086628ddf5ac8bb92bdba11ed03fe37445cf35f5e34e36d0ccfe7"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.12-1-linux-x64.tar.gz"
    sha256 "2c0a3e918b53541b299a44bd7f98d90ad34b23da0b64c79a21d2ae744de1a088"
  end
  version "2024.9.12-1"
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
