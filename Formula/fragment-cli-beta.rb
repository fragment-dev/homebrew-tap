require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5963.0.0-darwin-x64.tar.gz"
    sha256 "3f14933aab6ac18919de0600e6ae240f4a0d7cae6f55e23855d75948369969ff"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5963.0.0-darwin-arm64.tar.gz"
      sha256 "28493fde83c5beb5e4130a8b8b1bc713a7af8688bc2a2784910021b25241f5d2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5963.0.0-linux-x64.tar.gz"
    sha256 "b920c04fc85b28186c41f91d26ecc83d4f96fd120aa57450d1765ed681ccec32"
  end
  version "5963.0.0"
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
