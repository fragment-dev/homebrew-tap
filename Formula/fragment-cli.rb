require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.18-darwin-x64.tar.gz"
    sha256 "8e0abe5cfeabf3ce84b757d119a0d5f634fc2d2ee3876b64a5ed6ead38133c49"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.18-darwin-arm64.tar.gz"
      sha256 "114390fb8ea1111ab14edfec27ef86a3e46e1548fdc2cd58ac3e10aba5b6ea46"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.18-linux-x64.tar.gz"
    sha256 "870a1736a859b4b77fef951e4e97fef81197156191533f0fe72450730148097d"
  end
  version "2024.10.18"
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
