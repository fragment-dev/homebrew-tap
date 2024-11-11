require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5760.0.0-darwin-x64.tar.gz"
    sha256 "1f5108d3c8188e3352c7bdd92a4fba117f242f5d0e9fc4cc625c8834b286ef0c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5760.0.0-darwin-arm64.tar.gz"
      sha256 "b520ccde79ac939ddefab02023953feff91ed90e9aea077b3d20676e2af4511a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5760.0.0-linux-x64.tar.gz"
    sha256 "b37d61d46c3aeaab3c0474746fd132fa848f26cc5fe386bebe658e9c7ca55d11"
  end
  version "5760.0.0"
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
