require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2923.0.0-darwin-x64.tar.gz"
    sha256 "67b849dcd14d65bff62c2f87d6f52be28f144da7ab149189c656c4a3e61b8e43"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2923.0.0-darwin-arm64.tar.gz"
      sha256 "6afc7f1211844bb1055bc4608513e39079d399c60f4d9642fbe10d0b3e24ec2c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2923.0.0-linux-x64.tar.gz"
    sha256 "2e3620977819eb72ed73403db572375ec6d677889d16f75dd570de8166877c9b"
  end
  version "2923.0.0"
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
