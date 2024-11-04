require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5726.0.0-darwin-x64.tar.gz"
    sha256 "1394e2ceca2c897494a768c595dc13ac532dfb521e8ea8b8d860b7e4d7faf784"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5726.0.0-darwin-arm64.tar.gz"
      sha256 "e5baa93977bf56b5f272207a8c9251813407c1dcba3c70e27b297d0d7f4d3fa4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5726.0.0-linux-x64.tar.gz"
    sha256 "18744941663045c4152c3bd5b05042cf03530da6d599d7780e2bf4c8da7ffd81"
  end
  version "5726.0.0"
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
