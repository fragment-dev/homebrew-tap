require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4443.0.0-darwin-x64.tar.gz"
    sha256 "685f6f52fc4b8b2aa2c1ed1f22a2221839f34683ed97046485ab470d9612fb37"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4443.0.0-darwin-arm64.tar.gz"
      sha256 "e428083802a89322e16e8a81326a9258a2b9708cceced74ee42e4db3312bf765"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4443.0.0-linux-x64.tar.gz"
    sha256 "11dba180c2775879f92c64855398c43fc5c522efc2aec190bcf8bd7ea78d4c69"
  end
  version "4443.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
