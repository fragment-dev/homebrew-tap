require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5716.0.0-darwin-x64.tar.gz"
    sha256 "3c6e68461220546dbcfe8520d84ffd69662016e21f5c8ea82796a80431e6da8f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5716.0.0-darwin-arm64.tar.gz"
      sha256 "d49628bddeba8abe92c818342b1aa8a6f6bdd36e18a31150728ffab6ff1b2934"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5716.0.0-linux-x64.tar.gz"
    sha256 "78d6d34c262799bf6d6212aeec019ce70439aa92457c0bafc24613affd2d00b8"
  end
  version "5716.0.0"
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
