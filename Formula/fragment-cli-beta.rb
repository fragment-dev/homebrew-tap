require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3257.0.0-darwin-x64.tar.gz"
    sha256 "c464ae39bf38a06e4f51f49a1bfcb9efddc09c95a466bced267e16ce508c5cae"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3257.0.0-darwin-arm64.tar.gz"
      sha256 "8f8edf8c9a424f936dab4d6e2312422762c5901845bcda72d8c75cd4ee4833ac"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3257.0.0-linux-x64.tar.gz"
    sha256 "86f88a6a7b597680d3b056d15d14e5eb67d0d1ca22dca89fb9ae31ffce4965c7"
  end
  version "3257.0.0"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
