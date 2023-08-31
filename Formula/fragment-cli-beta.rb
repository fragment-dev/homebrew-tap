require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3458.0.0-darwin-x64.tar.gz"
    sha256 "cca80ea057ddc04cc331104525b80b3f08fdfeb7cbb3e1ecd1967576e1064a76"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3458.0.0-darwin-arm64.tar.gz"
      sha256 "7d2e69a383aa7470d8c20a0a285f2713508168f095eea2ba7c531d6b778b1b8c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3458.0.0-linux-x64.tar.gz"
    sha256 "432a367def6c94c421956f1155f981ef91a6fc072dd8671f3a6c54c15c821033"
  end
  version "3458.0.0"
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
