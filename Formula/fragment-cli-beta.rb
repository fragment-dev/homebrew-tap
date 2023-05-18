require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2694.0.0-darwin-x64.tar.gz"
    sha256 "36096ac803d0a86d7c5b520eba71eef5c27dd37e7fcabdd4e44f14684ae464e2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2694.0.0-darwin-arm64.tar.gz"
      sha256 "3e6ac1bce72665524105d339b965d171d7d01a867d57c1add730c8fec01f53a3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2694.0.0-linux-x64.tar.gz"
    sha256 "d7907d966eddc699d7af43d19798f8c9a45ed6abb0d65230aa10aaf4b42b8108"
  end
  version "2694.0.0"
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
