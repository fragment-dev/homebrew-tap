require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5390.0.0-darwin-x64.tar.gz"
    sha256 "86c801e4ab3b57f8ecc3cd2c769307f2851e797c6a2f3e1ebea658c392786d4f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5390.0.0-darwin-arm64.tar.gz"
      sha256 "730ece0c056f01ca8ce6b18dcda118dd30063ac6d00815bf9afc36c6b7cc1636"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5390.0.0-linux-x64.tar.gz"
    sha256 "b0ac440a2ee237f865b15628d1b05bb6c832f82147678757ba797756693a0075"
  end
  version "5390.0.0"
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
