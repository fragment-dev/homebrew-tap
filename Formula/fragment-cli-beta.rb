require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4228.0.0-darwin-x64.tar.gz"
    sha256 "8f349ae31648d03e0292293bcaed3b658782d4e5800a4b8f9c9a8ca386d99695"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4228.0.0-darwin-arm64.tar.gz"
      sha256 "ec880dcf975d7e92db010ccd243b338d7076e6508f079ded0bf1635434c2753d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4228.0.0-linux-x64.tar.gz"
    sha256 "ed325c1d9e1b1aa07bee936d2c61b3ad09fcb728109ab40d6b849dd8acf41409"
  end
  version "4228.0.0"
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
