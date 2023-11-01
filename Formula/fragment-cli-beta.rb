require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3954.0.0-darwin-x64.tar.gz"
    sha256 "520594fb3b3900cd8862af7fa1897630a5223545e7d6965f8103fc9c233a1833"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3954.0.0-darwin-arm64.tar.gz"
      sha256 "40e9d16c29b810424568e6c1a78a3ebf6ec4e67baccb3ca716b643f37efb4154"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3954.0.0-linux-x64.tar.gz"
    sha256 "9ab9508b4ef91bd310c18f3db1722f40ccecfef4747cfef8c0b8f290b0fcdba5"
  end
  version "3954.0.0"
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
