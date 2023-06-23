require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2910.0.0-darwin-x64.tar.gz"
    sha256 "96eaa5db23c78873df477875d852352a933a70ccaca511ec09945d45301800be"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2910.0.0-darwin-arm64.tar.gz"
      sha256 "d571da35d50a4ba907ebe93a185807b86b4d1bb0d04aeddf0fcbb9a5d8060c09"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2910.0.0-linux-x64.tar.gz"
    sha256 "252c8a370edda1b4854ee2d766c32054d41691963fb84179cef713ac73004f23"
  end
  version "2910.0.0"
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
