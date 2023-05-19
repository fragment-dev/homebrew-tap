require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2706.0.0-darwin-x64.tar.gz"
    sha256 "254b9f57327795f0625d09dfe821b4e2b76027fea6b7fa94dae06eb54f446acb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2706.0.0-darwin-arm64.tar.gz"
      sha256 "6ac28ba9249d5fe691ee7a40e0f6b2c24873e06964f6117750f17c7bdfddc3c8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2706.0.0-linux-x64.tar.gz"
    sha256 "29553df28a0265d0cb119d407ffea4babbf7e10c523217665d98bc28fdd3497b"
  end
  version "2706.0.0"
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
