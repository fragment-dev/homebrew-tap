require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4861.0.0-darwin-x64.tar.gz"
    sha256 "3fe660983d0b08526d69c5685c062d0eff211a3b5507f04ab623fa824e020d10"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4861.0.0-darwin-arm64.tar.gz"
      sha256 "08b1f86fd2ea8b5a4462aff5eb6c48ff2b5322f51e610af8db6f047809d5f21f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4861.0.0-linux-x64.tar.gz"
    sha256 "400de54c288a46e0205b0be614dbd6db1c1c0600f627faa840fbf535bbb930d4"
  end
  version "4861.0.0"
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
