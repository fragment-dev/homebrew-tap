require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3882.0.0-darwin-x64.tar.gz"
    sha256 "283b417af3b0ee58cd74055400f2fd8d03af5b658b57dea8f56abd64f6ba799e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3882.0.0-darwin-arm64.tar.gz"
      sha256 "be4d6612785aaac265422424ad1ddbf397789e4a6a10725948a94ae4f8601cb1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3882.0.0-linux-x64.tar.gz"
    sha256 "87d2517ed1f03fe063ac3ad227889c1b664db6c783cc793ffb54596fe06885b2"
  end
  version "3882.0.0"
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
