require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4275.0.0-darwin-x64.tar.gz"
    sha256 "6a8dba7fcb33061dfe9c1c2be9d67302ca82ccc378d4e956e5b0c06b8f01c514"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4275.0.0-darwin-arm64.tar.gz"
      sha256 "4c55a5f944e47b5fb0035e41f4ae0e4ecc2af2f1918dc9370283cd20fe83a553"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4275.0.0-linux-x64.tar.gz"
    sha256 "05e8e8525155174197b47b95170be0f50eba7701307f714dc7245709d7cd9e86"
  end
  version "4275.0.0"
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
