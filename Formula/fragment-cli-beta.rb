require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4756.0.0-darwin-x64.tar.gz"
    sha256 "7037fd0f94660e04835158e6808e2c50cd14719443c970beeb5e1f364199f6dc"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4756.0.0-darwin-arm64.tar.gz"
      sha256 "652c23dfe415fc80b3c7e32ac6dada6af101bddc4e2a8f42b479d076fbc54986"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4756.0.0-linux-x64.tar.gz"
    sha256 "4a38d1da2e89b901b18ec70f11e65d6970e9059d97d0761e4e3bafb5d75fffd5"
  end
  version "4756.0.0"
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
