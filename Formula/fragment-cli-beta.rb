require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4896.0.0-darwin-x64.tar.gz"
    sha256 "81ea895138c10eef36b2babef71bfbf09bf034d9af9128b416ba657911396339"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4896.0.0-darwin-arm64.tar.gz"
      sha256 "7b2be0b640e579d7a084a7d9f8676a73966e4fd2f392590af83fbd97f55452ed"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4896.0.0-linux-x64.tar.gz"
    sha256 "bbfecc4f44bab8439dded5180913cb2e587d12c3e998f2d1ceb58a34591015f6"
  end
  version "4896.0.0"
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
