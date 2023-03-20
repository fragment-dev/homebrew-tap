require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2248.0.0-darwin-x64.tar.gz"
    sha256 "f936582c1759ade7ff060db9d24001b19bf2735d3b89608410f6f5067102dbf9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2248.0.0-darwin-arm64.tar.gz"
      sha256 "2477bbcfb7299d89285957089158b952d320a0d7d210c040be7544a9943f8b97"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2248.0.0-linux-x64.tar.gz"
    sha256 "0ce231e0e081ecbeef96c194031eb16bd83856dbf4b6bbccf8dcd51d41d5bcd1"
  end
  version "2248.0.0"
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
