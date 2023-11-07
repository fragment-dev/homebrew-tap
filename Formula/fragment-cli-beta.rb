require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3976.0.0-darwin-x64.tar.gz"
    sha256 "fe0b1a3e4a789a9948ba7265e36bcb5ed6449aaf1149b92ca560ff14f30443ca"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3976.0.0-darwin-arm64.tar.gz"
      sha256 "aa55e2cfcd2ab75c51544ed685a45bf2688b8f7c258776ad5ae4aeb6d0e80c15"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3976.0.0-linux-x64.tar.gz"
    sha256 "3a1d79671f2d0b41ffb5c0dea3e221cd1f366c6d5d76ac0b491feeefb916bd94"
  end
  version "3976.0.0"
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
