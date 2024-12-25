require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5987.0.0-darwin-x64.tar.gz"
    sha256 "de26f26b99bd9ecc8bd542028689d2d2cfaf52c19413b5c2c3d9b0e141ce32ad"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5987.0.0-darwin-arm64.tar.gz"
      sha256 "012d4b37f23803562452a5040f2f0a3ea7caf415801157069a47cb4b8a65ff72"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5987.0.0-linux-x64.tar.gz"
    sha256 "1557cd2c9846a52422805019ade827458eb902cdc03c104db1b119b2289075d3"
  end
  version "5987.0.0"
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
