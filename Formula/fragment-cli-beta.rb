require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3985.0.0-darwin-x64.tar.gz"
    sha256 "076230f5736662b7f42ed9213a4c187275e827c97a406ab91f059f31519d0ba6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3985.0.0-darwin-arm64.tar.gz"
      sha256 "6a33561756d0d373b5ee2b5cbe7c2a6704ebf636637d22f2007d5dcffc600833"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3985.0.0-linux-x64.tar.gz"
    sha256 "9e9dd572815e872d4ec27bee188dbfd9d4f95c294bf5e79df0be0a35dccf03d9"
  end
  version "3985.0.0"
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
