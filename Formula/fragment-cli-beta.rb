require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5737.0.0-darwin-x64.tar.gz"
    sha256 "3f5e12426ab6d40569dac428430f63c30fac7c25f6f8913aee6226f33afd0cd3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5737.0.0-darwin-arm64.tar.gz"
      sha256 "77f3cd2ab59e1b62df0c55fdd5154b9ae9acf77d68ae1bb52966e81eca79cc5e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5737.0.0-linux-x64.tar.gz"
    sha256 "1c6c6cbeac13f5ea2e841f3a52aaa7c733b200539021cececf2c4a4838cd390d"
  end
  version "5737.0.0"
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
