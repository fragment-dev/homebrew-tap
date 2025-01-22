require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6109.0.0-darwin-x64.tar.gz"
    sha256 "9ddda9cd48fae5bf92679e92ef0565130c3f156120e51a9c0cd1c61289fdf666"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6109.0.0-darwin-arm64.tar.gz"
      sha256 "ee969d739ca2676be10503715bdfbf0f68449d09d30e73dc7a80482c65ad9b83"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6109.0.0-linux-x64.tar.gz"
    sha256 "adf896cc7a8c986f2576c5e2a377c27bbd86c8f50c8b4bd10218cb94802a07e7"
  end
  version "6109.0.0"
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
