require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4533.0.0-darwin-x64.tar.gz"
    sha256 "9e2e47cb40edbeba131503d00be9a2b9793e5e11e8410477fdb8a877b10ae7b0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4533.0.0-darwin-arm64.tar.gz"
      sha256 "2eb78494c0bd4db9ba8bab8c8f6d29aacb1f35878416ea14c340717a1d2c5b8e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4533.0.0-linux-x64.tar.gz"
    sha256 "24791f5b1ff99534d11cb84d7465226a790d1632c384ebcb4fde264bb2393ef0"
  end
  version "4533.0.0"
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
