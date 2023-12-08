require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4117.0.0-darwin-x64.tar.gz"
    sha256 "d97ec4e8f64fdecabe569e648fa3d4c03e0b81e7e968f98a4e21af1ac24beb08"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4117.0.0-darwin-arm64.tar.gz"
      sha256 "e47fe529fa2a46cd4dcf16e2e129724d3bc0b7033337fa9feb6a9bc179e668d1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4117.0.0-linux-x64.tar.gz"
    sha256 "b3c5f123a24303c8f9380adce373f2a3ea134d4b59432f20a5f766c5b4ade605"
  end
  version "4117.0.0"
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
