require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4591.0.0-darwin-x64.tar.gz"
    sha256 "6937d96f4c231e3b3915362415f097b999feb2c2524593fbb4af08bf2c868a00"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4591.0.0-darwin-arm64.tar.gz"
      sha256 "5de7d9334ce4f9d631ca51f01d4149d19609dde2c85182b2369d285ce5d42635"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4591.0.0-linux-x64.tar.gz"
    sha256 "5b30f2a8b492e605d9be23df0b5bcee0d4ed6ea2eee064183e4e5deb134815cd"
  end
  version "4591.0.0"
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
