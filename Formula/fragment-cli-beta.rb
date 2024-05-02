require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4993.0.0-darwin-x64.tar.gz"
    sha256 "6831bf03904fa93ba1686d46c6d3d4ba3aa98225fc1bb0ca202cd34859ef07ac"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4993.0.0-darwin-arm64.tar.gz"
      sha256 "ffa9659d718d44bd3df59c58408e15c59eb7fd8a1e519814c7a569d7518051d0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4993.0.0-linux-x64.tar.gz"
    sha256 "1b3cd49bdb2a4dc8ad2ac0b1594a9a3e26f2d75c65e69fd8020d2444421c6986"
  end
  version "4993.0.0"
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
