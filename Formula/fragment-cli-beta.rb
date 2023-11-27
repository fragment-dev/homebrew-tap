require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4044.0.0-darwin-x64.tar.gz"
    sha256 "d37b70085b02dbe07d478f6eeaf838a69fbd98273d24750611d3f5dd667a0fbd"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4044.0.0-darwin-arm64.tar.gz"
      sha256 "7ffc01c5d7d1d0e802d0cfb9dfc9b8e97093865561ee01f5f43d8081f355f7b1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4044.0.0-linux-x64.tar.gz"
    sha256 "3fa1da331246be5bb5f50aef47d2180afb3d8d9a0c16d1838672f842bfd66cff"
  end
  version "4044.0.0"
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
