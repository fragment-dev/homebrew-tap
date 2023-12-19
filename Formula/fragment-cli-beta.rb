require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4177.0.0-darwin-x64.tar.gz"
    sha256 "4528ffb68f8d59f9270830b638ce751398aabfce7969c92ad6cefef82dedadb0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4177.0.0-darwin-arm64.tar.gz"
      sha256 "48f2e84057d0e4dacd40d31451fe797ce35c13abe03b46a0d2b892a85fb6f815"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4177.0.0-linux-x64.tar.gz"
    sha256 "3481b804c6b250d7ef2aae41ea873d4d72292fa0a219b65dade0a1878883c700"
  end
  version "4177.0.0"
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
