require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3209.0.0-darwin-x64.tar.gz"
    sha256 "fc8bf88ba91568e7d45c0b76bd1218e097f26ac1392b26d088b6a74ca65bdad0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3209.0.0-darwin-arm64.tar.gz"
      sha256 "915234583e68f60668983e57e164ae38ec1f04853163786c3c398e3c910fcbcc"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3209.0.0-linux-x64.tar.gz"
    sha256 "c9afcd679f886a1c3c8fe7bfd1f863f2a48038f1f58e0bfbdc0ab84359bcc6e3"
  end
  version "3209.0.0"
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
