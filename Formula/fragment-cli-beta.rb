require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5160.0.0-darwin-x64.tar.gz"
    sha256 "8a0cf16d035e6765bac43ce7b7a04ded708fcd38f865b85468c5db53c453ae9a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5160.0.0-darwin-arm64.tar.gz"
      sha256 "fd4cf26a26eb096044af8d831c6b94f4e17b558694b7ab1ffee62c4f8f51fc91"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5160.0.0-linux-x64.tar.gz"
    sha256 "09732e9ecf7b5bbfdd4cfa703c4cda212bb654c622f3262a1b6fd0ccff243272"
  end
  version "5160.0.0"
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
