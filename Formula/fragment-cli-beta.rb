require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5866.0.0-darwin-x64.tar.gz"
    sha256 "f4b8c507063d95a61a463f760d482a476584c628adb0d8dffdc9ab78135810d6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5866.0.0-darwin-arm64.tar.gz"
      sha256 "1a4787526f0bfc25d6bbc7b728020fbb010d3d5b248f3b226cc0eb79a9e20c69"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5866.0.0-linux-x64.tar.gz"
    sha256 "c6c213efca696f15625c00facfce52ca08c8a369473ba012cbc9a4a0c87bc7e2"
  end
  version "5866.0.0"
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
