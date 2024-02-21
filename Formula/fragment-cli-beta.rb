require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4604.0.0-darwin-x64.tar.gz"
    sha256 "0d59b2e215ba673f6b57c5f31c9ab136b19a60ddc8e3f53e7031286cf568332d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4604.0.0-darwin-arm64.tar.gz"
      sha256 "6f4a5e35dc2695cfaee7e29daf413439c98443a155153bfc78ae95ebc29e418d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4604.0.0-linux-x64.tar.gz"
    sha256 "906374d96f1e856393988c8b732a2d08f5ff9be59d41665c2f7673fc8273308d"
  end
  version "4604.0.0"
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
