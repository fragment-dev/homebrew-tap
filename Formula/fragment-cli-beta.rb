require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5559.0.0-darwin-x64.tar.gz"
    sha256 "59c7a43365bec98f065d19c7cbc54bb8168bc4a6104f213d3ceb3c06c6c0cd87"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5559.0.0-darwin-arm64.tar.gz"
      sha256 "f1451cdcc956a418614ff9457d450a4cd8b8b12658a95987f8bd86b790b5fdaf"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5559.0.0-linux-x64.tar.gz"
    sha256 "b2424153588b0124e45c3fc86ddfe20bb0ded1d95522e6959a323678e3f4b288"
  end
  version "5559.0.0"
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
