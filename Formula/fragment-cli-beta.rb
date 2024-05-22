require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5101.0.0-darwin-x64.tar.gz"
    sha256 "c28cf66eb8f932a165899add3ceb36cfeb0c3d1d4ba4aa31ed93f2e5b2a6785a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5101.0.0-darwin-arm64.tar.gz"
      sha256 "e30ee9aae19caf0897e0c066a052000ff02d482644eb641d9686e4dbcb25c636"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5101.0.0-linux-x64.tar.gz"
    sha256 "dc1995263f049f982d9e44c77892c333457e6caa9977c41d476cfeaffc514cf9"
  end
  version "5101.0.0"
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
