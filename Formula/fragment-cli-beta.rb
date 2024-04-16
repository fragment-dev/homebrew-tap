require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4904.0.0-darwin-x64.tar.gz"
    sha256 "5d45ee8f9c4d66a322f4f4d574cb4995b7356c522308de303e0b000a370884a8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4904.0.0-darwin-arm64.tar.gz"
      sha256 "df55cae2f3d200256ecc25b53fedf2565ec892fbc48cc28e56f0dc4024671c56"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4904.0.0-linux-x64.tar.gz"
    sha256 "4b86a2ca5ebe9f8ad2016bb718993bd1f69978cf32f975f5afaa2be7c2fa3ede"
  end
  version "4904.0.0"
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
