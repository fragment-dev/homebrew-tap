require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5794.0.0-darwin-x64.tar.gz"
    sha256 "4db9af52eb5ca0d60cd6f5cb2e31e62c1a2f5d2f2a7d89be30b70f0f5293e44a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5794.0.0-darwin-arm64.tar.gz"
      sha256 "742e88e30d210ef108748b248b39e5e7ba1f0dea689630ad1a32c0e49f333b59"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5794.0.0-linux-x64.tar.gz"
    sha256 "a15750415dd47e04f7386c402229a9cb1165d33dd7ff41194e1c66852f4a2542"
  end
  version "5794.0.0"
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
