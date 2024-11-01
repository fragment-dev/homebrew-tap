require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5718.0.0-darwin-x64.tar.gz"
    sha256 "faf3f20e86fb65947b0fe44a5e0437a168c9960107d905917644a4839b6f9520"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5718.0.0-darwin-arm64.tar.gz"
      sha256 "cb3ebd269f2b6cb4f69e34934fd66dcfd5752373d6cef1d21a16139ddb9df3fe"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5718.0.0-linux-x64.tar.gz"
    sha256 "f6ff0c30817a9ded1216b6aaa695dc57ac7eb4e73445fd63c3d2bf3e3c8d5cd8"
  end
  version "5718.0.0"
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
