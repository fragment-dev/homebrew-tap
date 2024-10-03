require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5644.0.0-darwin-x64.tar.gz"
    sha256 "199b3f7b5f07ed3f28653eeb2b1d80c241d3e1b33b8c53cd4b3520c9833dc445"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5644.0.0-darwin-arm64.tar.gz"
      sha256 "66eab5d20c2afa559ed09806bad3a872585e02271730a5ffed9e10cc9f1b2a0c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5644.0.0-linux-x64.tar.gz"
    sha256 "384b71e28414c60fd31b0b0ef61828082a782ca2c50e9e6b23a7d5334ecf413f"
  end
  version "5644.0.0"
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
