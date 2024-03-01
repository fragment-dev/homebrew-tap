require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4679.0.0-darwin-x64.tar.gz"
    sha256 "24e6053b54887e5526d3428b1696b1c1cc20d2914cf891912ded63124a81f56c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4679.0.0-darwin-arm64.tar.gz"
      sha256 "6adcc32c44691d9a6f3402fa73e1d12bbe6103611c2c129d94fb067ae2742ad7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4679.0.0-linux-x64.tar.gz"
    sha256 "765ffe5e34520f2371586e071d325386aa4d58347dd72b1028dcdb80a2c0c6af"
  end
  version "4679.0.0"
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
