require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5679.0.0-darwin-x64.tar.gz"
    sha256 "77fcbdcf7f58b64fec832c5e6d7168b9f478c94ca581060c1462c37fadc1aecd"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5679.0.0-darwin-arm64.tar.gz"
      sha256 "b2db4a44c4153ecc4144588e6c4c7bbdf8ddad01c452be853b64a0eb32826173"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5679.0.0-linux-x64.tar.gz"
    sha256 "6daa9926b3a4ebb1a1be52ca76bbe41c033179363508a4add44a2fe26e757d78"
  end
  version "5679.0.0"
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
