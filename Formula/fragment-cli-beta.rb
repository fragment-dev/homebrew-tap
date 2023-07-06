require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3012.0.0-darwin-x64.tar.gz"
    sha256 "b818abbebdf0415cd66618fe4c00e9efa491304d09e956b91c98d4b82ac528f3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3012.0.0-darwin-arm64.tar.gz"
      sha256 "e244cca00bf508b17c5ff80717d4ec8757463af488abd2d4dc469151cbebb4f6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3012.0.0-linux-x64.tar.gz"
    sha256 "c8a8763279ca7539af082c20bb8028e4319db9f1168b596763c6e0a32dd8d2cb"
  end
  version "3012.0.0"
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
