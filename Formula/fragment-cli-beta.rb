require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4111.0.0-darwin-x64.tar.gz"
    sha256 "f660ee5d3c273f98fe0227d451aa5270607086f524316f51a5975c971b23506e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4111.0.0-darwin-arm64.tar.gz"
      sha256 "1e423bcca519bb6f911e88a85af0ef2cc8bd49daf795eb94d10743a13046413f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4111.0.0-linux-x64.tar.gz"
    sha256 "9ddf7e06494106b8587d6b820db2c25f1dece778c407e54d7d9c7f434bd77088"
  end
  version "4111.0.0"
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
