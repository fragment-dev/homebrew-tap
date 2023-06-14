require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2851.0.0-darwin-x64.tar.gz"
    sha256 "ffafcc0aea8347b62f83e990fddc560ee0678ca46b0391cbb73534250c4fe73c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2851.0.0-darwin-arm64.tar.gz"
      sha256 "a43b9bcdd987a9808cea87b839e7c0a1a0fa3ee0778594cfc707be96c1ade9f1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2851.0.0-linux-x64.tar.gz"
    sha256 "4e0b36fde4315e0c25f2835a8250628200a23324959774d6ef4529bb06a3fb9b"
  end
  version "2851.0.0"
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
