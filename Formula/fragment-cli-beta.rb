require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4880.0.0-darwin-x64.tar.gz"
    sha256 "2496537420b4efc771069f2337883844e31f2c86559c23bb7f50d40afce435c7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4880.0.0-darwin-arm64.tar.gz"
      sha256 "d2f6b8ce809e4811f2aa71054445a40f354d9faa0bc2735fd96d552edf21a867"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4880.0.0-linux-x64.tar.gz"
    sha256 "3b00a1b02c6a2e517e4186804175484ca4c4a9e5f2925367d90e837e39d5b643"
  end
  version "4880.0.0"
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
