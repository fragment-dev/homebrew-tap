require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4060.0.0-darwin-x64.tar.gz"
    sha256 "53391918fa6bebbe7f0150b71c59d4c954f00fbdefb97bccecd8bdad9da74c89"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4060.0.0-darwin-arm64.tar.gz"
      sha256 "c9b1b4dc42da290310831c2d637fb9810d181c6fc6e4e53e5c6e8194a7c6a0f3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4060.0.0-linux-x64.tar.gz"
    sha256 "3fc14319815940b53e8fda1ad72aae1cab7cfc01dd1ec7453dda194d09688de9"
  end
  version "4060.0.0"
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
