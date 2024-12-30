require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6002.0.0-darwin-x64.tar.gz"
    sha256 "f7f0794b6e5f800c1185dca43194cf8fbbbbd1df19c256b13977325ea9cd1b7f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6002.0.0-darwin-arm64.tar.gz"
      sha256 "23436fcf0ac425bca01b59cb14691c958202a142e0fc20ac912aba15f08ab0c1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6002.0.0-linux-x64.tar.gz"
    sha256 "9c05e253e4a454cfbdf0f40962543c24a3116415492deff9a2d0de2b335a2e60"
  end
  version "6002.0.0"
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
