require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3042.0.0-darwin-x64.tar.gz"
    sha256 "7b4e9e45e5f51434b9a5deb75dffbea31c4570f100737efc2a0fbd0f9081d46b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3042.0.0-darwin-arm64.tar.gz"
      sha256 "79054e4387815622064ea3177f63dee4559065113fb996450a6a626d5ee12e88"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3042.0.0-linux-x64.tar.gz"
    sha256 "cbb43e552a856ace5a0fa240953e6cadfd16a8cd215287a66cf9048da352ff24"
  end
  version "3042.0.0"
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
