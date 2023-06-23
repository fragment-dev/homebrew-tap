require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2921.0.0-darwin-x64.tar.gz"
    sha256 "39b7826832504a4d8265c26fa45ec7084c7d0b152a9164ae473a27db4fc03fb3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2921.0.0-darwin-arm64.tar.gz"
      sha256 "4f95cea10bed6679782d41fee142a0e8156754de4b66e40f261518442c9bc987"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2921.0.0-linux-x64.tar.gz"
    sha256 "448d2fdce4a361098debde6fcea04cc696ae64c30e46149ed29ec272b9cd2980"
  end
  version "2921.0.0"
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
