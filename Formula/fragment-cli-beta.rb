require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5520.0.0-darwin-x64.tar.gz"
    sha256 "f42a0c6be936ec2d11053d333b02cf044833b87f97e11bd341b97664f22d902c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5520.0.0-darwin-arm64.tar.gz"
      sha256 "7761e67ba45ddeb59faf6bdc2b2314c4ac6ac5adfd34ff521866c85aa7fcafc7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5520.0.0-linux-x64.tar.gz"
    sha256 "4ceafb4c73901b5bafa9231c1a205eeba385b3fa3e8b051fcccdbd98fd9c1a97"
  end
  version "5520.0.0"
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
