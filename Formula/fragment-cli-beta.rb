require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3837.0.0-darwin-x64.tar.gz"
    sha256 "207d539b9c81d224fc317c8b2af55f00d93bbcebbf056beb34573b8e8d777073"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3837.0.0-darwin-arm64.tar.gz"
      sha256 "ba3d80a552855e6cabbadfd0dd23e2ff444713b0ed0e082165337b8bf6c680e8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3837.0.0-linux-x64.tar.gz"
    sha256 "cdaf12bee783fdc1e8c43cc6a2b5b450cbaf4a3316590ab725e024f215bbf314"
  end
  version "3837.0.0"
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
