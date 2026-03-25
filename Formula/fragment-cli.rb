require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2026.3.24-1-darwin-x64.tar.gz"
    sha256 "2e6988644b38195534026768cdfdcfd0ea2c35c9a9b6774aee34dcd9cc89fe86"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2026.3.24-1-darwin-arm64.tar.gz"
      sha256 "9f464abbdbd0b0aaac4499195c3a25373bcfdc8041b003ee9484517187b61849"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2026.3.24-1-linux-x64.tar.gz"
    sha256 "0a0267f59949b302abfed10ae1a349cab8584c0564ebfe817cd710d44bb3d956"
  end
  version "2026.3.24-1"
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
