require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4611.0.0-darwin-x64.tar.gz"
    sha256 "0cfed16d592a9e22e81a16c8d6d5e9fc65b3b419320fe32d5aaed8d0b3ead0c9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4611.0.0-darwin-arm64.tar.gz"
      sha256 "4a3f47d5cb648bae146020972dce0fe460259aaf381b8f47e34de022bf1d5627"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4611.0.0-linux-x64.tar.gz"
    sha256 "48312e7c22ff02eebe01e2a7e442c431fcad46cd65b0b024935ee0673c9c8adc"
  end
  version "4611.0.0"
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
