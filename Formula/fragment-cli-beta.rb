require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6134.0.0-darwin-x64.tar.gz"
    sha256 "65b9ceb210ba2b02bad83d0298183d9725ca9c4f15858d056f854b07aa7f3fb4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6134.0.0-darwin-arm64.tar.gz"
      sha256 "60cb611eacece0f3710e6a9eb41643c6553cb7b2cfc1d437789602d68bdc815c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6134.0.0-linux-x64.tar.gz"
    sha256 "88206c739781c6fb13e6ebb5c0ee5e399693443393412ae6ae2580b1f45ac8e6"
  end
  version "6134.0.0"
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
