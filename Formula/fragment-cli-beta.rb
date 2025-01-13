require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6073.0.0-darwin-x64.tar.gz"
    sha256 "14aa01b5c96069dd5d0493d0ed09f8a40a4908d66f27867bfb76cfaa54fcbfe3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6073.0.0-darwin-arm64.tar.gz"
      sha256 "3f705449894f6eaa3e37a7491a1507c9c14ac482fadeb457384b630528e66db7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6073.0.0-linux-x64.tar.gz"
    sha256 "383726f944399ba7ba82df9ba77e94b58a54a9fde3417a6832006605a703c010"
  end
  version "6073.0.0"
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
