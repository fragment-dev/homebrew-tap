require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3167.0.0-darwin-x64.tar.gz"
    sha256 "59a05d6b18d7ad802f2854caac5b7592aeb725c17070f3395856f57f3c13e182"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3167.0.0-darwin-arm64.tar.gz"
      sha256 "ea775fa9149e8a13da574a51dc50b2d4d898c0ea4a00d4cf0796357744999b2d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3167.0.0-linux-x64.tar.gz"
    sha256 "0081973a2811a27e8ba6fbc51f5687a4a1793bb705dfe234524064818db76c60"
  end
  version "3167.0.0"
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
