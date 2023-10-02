require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3738.0.0-darwin-x64.tar.gz"
    sha256 "ec794e5390fdc5f0cc1ce2d061aaebf2495fec875f57ae382bf222562467b813"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3738.0.0-darwin-arm64.tar.gz"
      sha256 "7005bc6917fcc5612a1fb15b48c4d4aafcb77193c88c3976e98be21df00b14e9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3738.0.0-linux-x64.tar.gz"
    sha256 "ecc8b15cba1e5c7fe4b609224eb34e06a1757c497d8ed99f2d0142c1b5fd68a7"
  end
  version "3738.0.0"
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
