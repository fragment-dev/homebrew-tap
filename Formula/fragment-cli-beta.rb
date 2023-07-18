require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3115.0.0-darwin-x64.tar.gz"
    sha256 "e7d4b4897eb1db063a08a83678a26f9f2a1c2a2c0d23f4fe3e35ab8c82f704c6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3115.0.0-darwin-arm64.tar.gz"
      sha256 "536852bb888d96accb1850d2b90f55833c6b3d6d725cdbc2b9a39ea58686e77a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3115.0.0-linux-x64.tar.gz"
    sha256 "ea7f00d47b0574bd1e4684cf8bf33dbf842f3472993d2db2b9fee45330db3774"
  end
  version "3115.0.0"
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
