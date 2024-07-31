require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5453.0.0-darwin-x64.tar.gz"
    sha256 "8f5a0a7a0e5f21313bc5cb19389190666204608f08fd301b85dd254a1ff0484b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5453.0.0-darwin-arm64.tar.gz"
      sha256 "49f8c7cf441757055baedc4c636022da1bd81199130210b478fb00adb4228a7d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5453.0.0-linux-x64.tar.gz"
    sha256 "8abbb84349e2d7e16bc3a8275342ebd5ff4c934b90e976bde93c03444d3d679b"
  end
  version "5453.0.0"
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
