require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2579.0.0-darwin-x64.tar.gz"
    sha256 "1af8a70b1bf8499145465ce531061010b26593258e94bffabb8f9aeba82c53a3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2579.0.0-darwin-arm64.tar.gz"
      sha256 "38447da1b74539fd07534a4bbf7c60b7ba249deb2122e8a26f26f3dfd942f39a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2579.0.0-linux-x64.tar.gz"
    sha256 "ee52e3faf3cc2a2130c63ace4eb913052c5a0cb8c79602238b320ce50e4441a0"
  end
  version "2579.0.0"
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
