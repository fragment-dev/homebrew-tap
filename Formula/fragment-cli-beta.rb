require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3989.0.0-darwin-x64.tar.gz"
    sha256 "533dcfd9ebb1f6a1cb92d53bf420b86e76b0337653bf4a44686b66f74a2385d0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3989.0.0-darwin-arm64.tar.gz"
      sha256 "1ea79fdbe4c9f8c81c5911bfa4e9e07d1eb05fb95a996a49f8a5b099e10da235"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3989.0.0-linux-x64.tar.gz"
    sha256 "3d746924caed3188ce58d1cd7c98c9358ab0ddcff6079b04ee753c0bc445ebaf"
  end
  version "3989.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
