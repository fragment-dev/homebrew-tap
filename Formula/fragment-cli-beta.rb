require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5183.0.0-darwin-x64.tar.gz"
    sha256 "bb95d124f7c96e2083fd2383f05695d3a4fd09ba7e11d0bd3eba0e640755922b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5183.0.0-darwin-arm64.tar.gz"
      sha256 "cbfa8b0c64f0892c8971c6ba07a6b89948e388e9e8a67ac1479f23698828fd09"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5183.0.0-linux-x64.tar.gz"
    sha256 "be0f2dba4c23f9db69ef2a2fe275212df95d0a69ee3f1447d17183606c60d236"
  end
  version "5183.0.0"
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
