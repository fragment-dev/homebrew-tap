require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3761.0.0-darwin-x64.tar.gz"
    sha256 "9153d7b96eccaa8517cddf0dcddba467393e1a91064a51b42598a6ad519977bc"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3761.0.0-darwin-arm64.tar.gz"
      sha256 "b04bc6a7a8a74add3c1b57714bfe1696c41dfe6c5f85e57643f219c3f602b60a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3761.0.0-linux-x64.tar.gz"
    sha256 "204c1f9317c19e27fafbce2119bf8930c440b48605de275429ae86dcd23c0296"
  end
  version "3761.0.0"
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
