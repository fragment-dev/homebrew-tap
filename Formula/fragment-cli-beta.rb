require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5706.0.0-darwin-x64.tar.gz"
    sha256 "d9941c438cfd038e07ad788fec829faea6662e56fbfbf81af96d1b58df792b0e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5706.0.0-darwin-arm64.tar.gz"
      sha256 "630c2d92dc20fb9ca9774c5e79a98376f473e464eb6cb62b6889c89e7fd5b446"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5706.0.0-linux-x64.tar.gz"
    sha256 "f42c830d5d6d027c31e7c5b689e091f28fb65031b3998c5263d12d6f8a8f0326"
  end
  version "5706.0.0"
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
