require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4850.0.0-darwin-x64.tar.gz"
    sha256 "8f7af7d008817072f62e1b24d1f470cfbcf31f6291c32126ee98d172fa2c9fd5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4850.0.0-darwin-arm64.tar.gz"
      sha256 "ba578e4d2a32ad24432ae93c0e67de5a4b3743bad08c5f988f84cffccdb5647d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4850.0.0-linux-x64.tar.gz"
    sha256 "42779f6843d61961072c4cdcc5a3b6974e1e372af09dcbc0bf70ca5380a179b3"
  end
  version "4850.0.0"
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
