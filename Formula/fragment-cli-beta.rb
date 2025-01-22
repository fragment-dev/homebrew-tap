require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6107.0.0-darwin-x64.tar.gz"
    sha256 "de1c23bf66a265230111d5b33b707225552545e4d5a058a54399277f553a6f6a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6107.0.0-darwin-arm64.tar.gz"
      sha256 "35e45431f8f25a0ca449269bc0c19ef8d4e59863bc952757a0efbd97309345bd"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6107.0.0-linux-x64.tar.gz"
    sha256 "9ba139b5bc3d3d6a2dce756c0be9c55a6e23973d874cbf7db19b1b2446066bf8"
  end
  version "6107.0.0"
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
