require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5734.0.0-darwin-x64.tar.gz"
    sha256 "18e69f89295bc4079d0234cff2bbb34b8081bfe340be96b5844a47caf47b1e86"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5734.0.0-darwin-arm64.tar.gz"
      sha256 "e9cae4c5fdb770625c50d016c6bbea8af2603ec93ac9564bd0cad40fea1937be"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5734.0.0-linux-x64.tar.gz"
    sha256 "aed77df1f5afd984715643aaa2bb4fbcf4715b98984a83813885c19d7f02033c"
  end
  version "5734.0.0"
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
