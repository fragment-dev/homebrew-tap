require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5506.0.0-darwin-x64.tar.gz"
    sha256 "0227480ca741083fa2e074e5996f1345d3b1f61dbcc4ce844a08072ed240fd5a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5506.0.0-darwin-arm64.tar.gz"
      sha256 "1ccef4738ba3ab8de3136f28703add21fa279bed19b257e4ab755810eb65efc6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5506.0.0-linux-x64.tar.gz"
    sha256 "7135b2caa380a202ab998b3ecc86cb00f05709af8256667e922373c9daffc322"
  end
  version "5506.0.0"
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
