require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4963.0.0-darwin-x64.tar.gz"
    sha256 "608976d57aa2ef0ea51be6be65881679b571aaafc90adae6957f5aa285384f0a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4963.0.0-darwin-arm64.tar.gz"
      sha256 "26ac5ba14b12cfa6cda640c89ada68e82fd8c9b8b643c9abbc8b92c9339107d5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4963.0.0-linux-x64.tar.gz"
    sha256 "9c2f43dd957375442567763ce7b1539cdb100403695b3d80a493dbe601086106"
  end
  version "4963.0.0"
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
