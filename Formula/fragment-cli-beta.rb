require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3137.0.0-darwin-x64.tar.gz"
    sha256 "7291bdc17170709b1b7827891f56fa27d00c33cd7b32ebb99dc1f3f29e001e45"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3137.0.0-darwin-arm64.tar.gz"
      sha256 "221df7462ad10201ad75d00b7f6ee27f2da2b81f7bb6c4710974e55c66ffb2e9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3137.0.0-linux-x64.tar.gz"
    sha256 "bed4c8579af4359962811abf164cccfd7c10ef7c8e6381eddef6d99ade1955bd"
  end
  version "3137.0.0"
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
