require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.1-darwin-x64.tar.gz"
    sha256 "5d9dab8980f3f22c9246fefc252ccafd4df748f86acb95be146c92ff6175f703"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.1-darwin-arm64.tar.gz"
      sha256 "ef6ffdc9afb652e3e717eb3be4b67c271ff081da38a78df73dffb2f68594f43b"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.1-linux-x64.tar.gz"
    sha256 "b8e0ef4139ce56c039fdae03189ce90df0b0ec9e9bc5aeb6d63ad757049d7eb3"
  end
  version "2024.10.1"
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
