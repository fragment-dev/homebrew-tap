require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4356.0.0-darwin-x64.tar.gz"
    sha256 "7128587c67d17b50be9014cb000414069e7b05c87ba8f42918f3e9c775049243"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4356.0.0-darwin-arm64.tar.gz"
      sha256 "a86d457f8d3a6a8e644f1fdee35c57357ac6c164b8c0bb47b3aacef2a5ca9201"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4356.0.0-linux-x64.tar.gz"
    sha256 "f0d788ca0ae5f12437f34b4d2b1e4621edf9444bb17be636b3d293a1ba40dffd"
  end
  version "4356.0.0"
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
