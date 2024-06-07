require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5240.0.0-darwin-x64.tar.gz"
    sha256 "a97c41980353d62259cb839f07bc8385cd0eca5b904f26efa8b88801f91001c3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5240.0.0-darwin-arm64.tar.gz"
      sha256 "e129d440b9587ffffb3e04cf3e34ec819b2af96c04f291a7c556d92f2b59ed15"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5240.0.0-linux-x64.tar.gz"
    sha256 "26a90ea2b2ca05ad27da6a4d53f85fd9fec4b5eb0a5f0344d64503f43b62dada"
  end
  version "5240.0.0"
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
