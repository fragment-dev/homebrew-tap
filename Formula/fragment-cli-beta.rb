require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5538.0.0-darwin-x64.tar.gz"
    sha256 "e742bb5673581f92e31cb64472ed8a6eb5a11bd5bcfb004d10fca4c30bef6e96"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5538.0.0-darwin-arm64.tar.gz"
      sha256 "39a22efbd2f69345d84547e11ba75aa7141bd3d1b3a98ceb94eac8102bdf1a21"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5538.0.0-linux-x64.tar.gz"
    sha256 "5310778512693342e67972191c22d9f53931c6555166f7c2341609e78edcd2e4"
  end
  version "5538.0.0"
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
