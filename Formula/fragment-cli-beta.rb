require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2838.0.0-darwin-x64.tar.gz"
    sha256 "82c126ca48b804f1d0be06562dc0ab34210f9f14bb7f1a0b86894fdf87df541b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2838.0.0-darwin-arm64.tar.gz"
      sha256 "22dec5347297689487f6056eacbd2de96e3063cc01018ea533305f87bbb8ec0d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2838.0.0-linux-x64.tar.gz"
    sha256 "8212eb38ebb256e9b4345eaea5e15a65c75d22d894210a647ec8c853b00fa9c4"
  end
  version "2838.0.0"
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
