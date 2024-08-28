require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5551.0.0-darwin-x64.tar.gz"
    sha256 "86fad3d5d2dc03711526be0ca740766a81d8a98ae2eefed767db4b430059917f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5551.0.0-darwin-arm64.tar.gz"
      sha256 "d4567f2f87f35ebd168f0f4f39f41477a99ec22554a2f736049c27ef2e0a463b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5551.0.0-linux-x64.tar.gz"
    sha256 "e248395f275d6e78639990a90753fa7ff8e13694c8d02a4173dfee63f3eafe3d"
  end
  version "5551.0.0"
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
