require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5493.0.0-darwin-x64.tar.gz"
    sha256 "d16542a62122be6a1ae77a2f8aaf2f94d449a423153f4205181da579007c7dd9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5493.0.0-darwin-arm64.tar.gz"
      sha256 "560a7e19df38199d6d0b31d29a18949eccafc359a14114c9af58e5ff3dc7bbe7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5493.0.0-linux-x64.tar.gz"
    sha256 "6189c34a3798390605f1afe194fe7e10c857a80393c116467f677356b5636fa4"
  end
  version "5493.0.0"
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
