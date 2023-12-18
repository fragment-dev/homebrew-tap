require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4160.0.0-darwin-x64.tar.gz"
    sha256 "f53d1e84ba44e6db1263e6c81b52c01a42616038dbe471657e4ac9e60df8eb72"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4160.0.0-darwin-arm64.tar.gz"
      sha256 "583ee3eeb43aa20baf8a48da75f8678a19d1aebfff475c8a4a471092e51f3973"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4160.0.0-linux-x64.tar.gz"
    sha256 "3fa1988da7f7c756e8d3d15a3d66493978fcb346fdbca093be35ed588a488394"
  end
  version "4160.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
