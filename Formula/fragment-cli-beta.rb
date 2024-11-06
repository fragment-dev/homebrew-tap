require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5738.0.0-darwin-x64.tar.gz"
    sha256 "ae5f9daf97797843a2c749552bb34e32f0bb6eadc936e2d03bdace790cf6c3c3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5738.0.0-darwin-arm64.tar.gz"
      sha256 "3f9cb7ab1f02828e98ab4db20066420d933ca3f25a53962ffcd25358c74c0c6b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5738.0.0-linux-x64.tar.gz"
    sha256 "4a7afcda2adeb6be60399bac80c1a24eeb937cca8dde326f2c772e163c7db70c"
  end
  version "5738.0.0"
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
