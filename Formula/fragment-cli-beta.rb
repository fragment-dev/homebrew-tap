require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5225.0.0-darwin-x64.tar.gz"
    sha256 "5ebedb1abfbb53c364fda45f3ba38fa613628a1ed3bb08b1223501f0dd2ec7b5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5225.0.0-darwin-arm64.tar.gz"
      sha256 "9ae863daccfac4c0b2d2a0b1b4956ae20731d6de7774dea93ef29eba29d54986"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5225.0.0-linux-x64.tar.gz"
    sha256 "66a0dbe4f10e9b146484d7e47f4e3d6b3bdd26583196cca0cb8038893f624c22"
  end
  version "5225.0.0"
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
