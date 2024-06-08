require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5245.0.0-darwin-x64.tar.gz"
    sha256 "cc3610cb175447e0330e8c611e48544f49d36aeaf1701a4f1d1329e39a8ccbfa"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5245.0.0-darwin-arm64.tar.gz"
      sha256 "fb5ed24cfdae82d51007fdc20125b30dbfb8073e37171bc27fbf1305e6ee6d0d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5245.0.0-linux-x64.tar.gz"
    sha256 "44e2b27da31f330273be76bfe9e79b0b2e5fd561d027b7251a1d4f5508387158"
  end
  version "5245.0.0"
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
