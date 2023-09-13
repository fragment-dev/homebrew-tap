require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3550.0.0-darwin-x64.tar.gz"
    sha256 "ddfd6f6446466d0fb23e1f989ccce1a918c85640e9895a46fb44ead881d8c5bd"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3550.0.0-darwin-arm64.tar.gz"
      sha256 "aa1fd0bc540390723d0b5401537986b89b1a60de5d6ed87584a8409d72207ef1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3550.0.0-linux-x64.tar.gz"
    sha256 "f16580ae55d67b7965f7f973d8fdd80a32b67d6022de8a15d1f984cb88ea8848"
  end
  version "3550.0.0"
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
