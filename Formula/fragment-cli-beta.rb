require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2346.0.0-darwin-x64.tar.gz"
    sha256 "2b0b7c077f2aae285948c785705dc644d31d3c9861c99b46ef6cd740775d3e59"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2346.0.0-darwin-arm64.tar.gz"
      sha256 "50ad95e95ab6ca60fc88d4058e3fa165470fac934bc9756321fb38686f4d1bda"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2346.0.0-linux-x64.tar.gz"
    sha256 "b39e17531c43e4ca6e7fa6cfc9df514bdbf8033815d336e566aebeef91a360c6"
  end
  version "2346.0.0"
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
