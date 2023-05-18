require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2699.0.0-darwin-x64.tar.gz"
    sha256 "7afd1ddbe23f54c58950e3b7749fef636dbee9d63e4cfa5466ffe0291ef282e6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2699.0.0-darwin-arm64.tar.gz"
      sha256 "10d717659d1e593b141db88e5d5f0b50ee88176d43dac6b46d096e5351e63d08"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2699.0.0-linux-x64.tar.gz"
    sha256 "8fed59bf1bcbadd617fadc332cc40f00d4221530aed8403233bf11f653dd8de0"
  end
  version "2699.0.0"
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
