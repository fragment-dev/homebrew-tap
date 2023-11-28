require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4052.0.0-darwin-x64.tar.gz"
    sha256 "b7fe3212300cf4f699ea296e4cc86047cab5b8492c9316d9cb00df10aa41aadb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4052.0.0-darwin-arm64.tar.gz"
      sha256 "baf45c528347d95edcf845893fac2a3770d2d32faf115d13f39cf400e75d4ade"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4052.0.0-linux-x64.tar.gz"
    sha256 "85e8060e82ebf195fee14013ef1d7be659788b159d069d34589a577f0b8f6c41"
  end
  version "4052.0.0"
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
