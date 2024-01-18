require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4364.0.0-darwin-x64.tar.gz"
    sha256 "fb60db0474b82e0c5fcf4099b531de2f43aa96c2b3d18db99ecf2044e1a90846"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4364.0.0-darwin-arm64.tar.gz"
      sha256 "704d6e0135d406da5ac262f0cf8a5a687fbaef900dd781aedfd061900406ef61"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4364.0.0-linux-x64.tar.gz"
    sha256 "cc7788c345b6cce558ab2894802d0a1e517f480c0ff9d6857b1a03ee58df7408"
  end
  version "4364.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
