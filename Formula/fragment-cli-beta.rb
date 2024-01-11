require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4315.0.0-darwin-x64.tar.gz"
    sha256 "71fcd089d3b1fe1b9b6b7696e1f0b5462d8d83364c250e68373baea379fd631e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4315.0.0-darwin-arm64.tar.gz"
      sha256 "86f91440f83389b3f4aa2086d7000209356a5c71fa0d80d545ff6a392511ce36"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4315.0.0-linux-x64.tar.gz"
    sha256 "99c0330c6078c3d0010f50a7535b8d5bc92c767eee67d1da24ef01de16ed4a44"
  end
  version "4315.0.0"
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
