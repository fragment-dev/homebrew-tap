require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4043.0.0-darwin-x64.tar.gz"
    sha256 "e16d74c68eaff5a0313c57bd18763f51daf5ef5c6795bb169400331fab1e3838"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4043.0.0-darwin-arm64.tar.gz"
      sha256 "b7ef2d689893c58399426df504783ace157a10e3a3ef39713031814dcc260dbe"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4043.0.0-linux-x64.tar.gz"
    sha256 "52d12b4ba54ff9b1f9cbf96e807a3695b299cfa762fda4f79bd002443894689e"
  end
  version "4043.0.0"
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
