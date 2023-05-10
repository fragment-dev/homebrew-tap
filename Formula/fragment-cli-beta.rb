require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2620.0.0-darwin-x64.tar.gz"
    sha256 "60648a26d7988694ebf8ae67b9f41fda0625a4d0e3c9d119e904825eec4b2cce"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2620.0.0-darwin-arm64.tar.gz"
      sha256 "c0c03306395934895bfa5162efdc6a916fd8abf347fe10775df6767a51f86c6d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2620.0.0-linux-x64.tar.gz"
    sha256 "cfe46416e97b3c41958f71c156618fc9754780fe076650e840c18f1673751e46"
  end
  version "2620.0.0"
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
