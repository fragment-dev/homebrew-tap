require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4848.0.0-darwin-x64.tar.gz"
    sha256 "497538c49933c4c6a815f960220e908db81c9221500eb44957306382f01138cd"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4848.0.0-darwin-arm64.tar.gz"
      sha256 "33888ce958bf8dcbd35907a99198ef618ff1e91cfb05e4a3d5089f1de233d685"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4848.0.0-linux-x64.tar.gz"
    sha256 "5348c8aba3d2778a1b09f016cdf8ec44db2b2391e1c035bba8afadbcb5f1a175"
  end
  version "4848.0.0"
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
