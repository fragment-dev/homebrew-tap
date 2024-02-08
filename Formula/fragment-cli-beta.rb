require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4527.0.0-darwin-x64.tar.gz"
    sha256 "13c14447e75c6001c8bcb21ef8eb92301f73fd38d344ddf6739e8d1a10d25562"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4527.0.0-darwin-arm64.tar.gz"
      sha256 "aa1e62e0322e0af880e332b4352a38c1f18d427b7be60f944b52c6f02cfa5d2b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4527.0.0-linux-x64.tar.gz"
    sha256 "e89d11b14c8b4524b38e3296b42547f708d35145bc52b855797ff5320bbae23c"
  end
  version "4527.0.0"
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
