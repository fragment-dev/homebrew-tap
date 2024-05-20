require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5088.0.0-darwin-x64.tar.gz"
    sha256 "503d8743c6b46b8a514c1bd1a674342c4316685968d1f5db4d6fb62427ec9a77"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5088.0.0-darwin-arm64.tar.gz"
      sha256 "34eea42d69c65495b9988f0147badca17b53dca9648912bfb8f6ed031c25271b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5088.0.0-linux-x64.tar.gz"
    sha256 "5d574699f1e3b34ecac6f62c34709cc9955efb4633f7362ad66337f98d0ea5e4"
  end
  version "5088.0.0"
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
