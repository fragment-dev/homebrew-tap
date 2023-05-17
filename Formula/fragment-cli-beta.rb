require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2684.0.0-darwin-x64.tar.gz"
    sha256 "0434d3d338b84e50db1917f43d8b503095bfaa8136f72d546928177508620bfe"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2684.0.0-darwin-arm64.tar.gz"
      sha256 "57e9ffb084839328fda67d58b6097bc28b7a72b703c1c31cf276b8134340ed8b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2684.0.0-linux-x64.tar.gz"
    sha256 "f68fe475870212eb361f05e244ac16e31356374d69907c49be44a273b51ce5d2"
  end
  version "2684.0.0"
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
