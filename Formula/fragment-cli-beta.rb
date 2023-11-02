require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3964.0.0-darwin-x64.tar.gz"
    sha256 "a113796c909382de8e0d24a539f3e4374ba6949e8a11feac455ba298c07204b9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3964.0.0-darwin-arm64.tar.gz"
      sha256 "64afdf867a7296fb1019230d19f313c5508c6edf1163c88dbdb4079aadf77ce0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3964.0.0-linux-x64.tar.gz"
    sha256 "96adeb7c485b0088eccf1540c2fa2a63c0bb1d94676e7b95ad56d0453baa41e8"
  end
  version "3964.0.0"
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
