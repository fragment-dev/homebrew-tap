require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4654.0.0-darwin-x64.tar.gz"
    sha256 "aa5a62bced9015de6865153b7c7b9c3e112fa0d15429d9894a29fdbf31a72abb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4654.0.0-darwin-arm64.tar.gz"
      sha256 "317a3fdda9c32baaf87509d32350e44505efca8b9768b4f638ef6730e5afae39"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4654.0.0-linux-x64.tar.gz"
    sha256 "ff27ef736c8871062b80f42be8e44a0c61f9e887d02a4608d836282b40178519"
  end
  version "4654.0.0"
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
