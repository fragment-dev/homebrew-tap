require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3591.0.0-darwin-x64.tar.gz"
    sha256 "571270a43bf910878bb0ad4f9b98a691a2e77d5661e1beb85a99fc36aef285ef"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3591.0.0-darwin-arm64.tar.gz"
      sha256 "c49228ae64101001df921eb641e0945fc73c6fc37d7dbba35b4b25fb6a8b9c5e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3591.0.0-linux-x64.tar.gz"
    sha256 "3f828597907ee09d0b2d3ec620f753391d1c51e326b8ad6cd931407e0a452e78"
  end
  version "3591.0.0"
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
