require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3146.0.0-darwin-x64.tar.gz"
    sha256 "963cb82eae7122c4f15f8779569e990530beb2f7246f118bd17db69a97ab8a7c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3146.0.0-darwin-arm64.tar.gz"
      sha256 "c5b06f86db76a99caa87a88bd2648405f79bda6288870a1c57e7853364067ef5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3146.0.0-linux-x64.tar.gz"
    sha256 "1462ef8c074865b6cde3adf7988b0a1bc205c16f8c00a942ca074710383e0f2e"
  end
  version "3146.0.0"
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
