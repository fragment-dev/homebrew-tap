require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5530.0.0-darwin-x64.tar.gz"
    sha256 "304308b5549236c77c9d7cc7ddfbafabe1195442d5ed11493c81b905dc325da7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5530.0.0-darwin-arm64.tar.gz"
      sha256 "bd3b7650842fbb775d2692491e4a1b2c92066ab0089a1b300207671f5abdd5df"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5530.0.0-linux-x64.tar.gz"
    sha256 "05ab61c373de114066f4ea245b1879e658aba6001e6d7fc50399c089b02a7952"
  end
  version "5530.0.0"
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
