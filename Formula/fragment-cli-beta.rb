require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4746.0.0-darwin-x64.tar.gz"
    sha256 "4b1a73184665e2b43c9a86bb7ca5ec8526e500f7af0a01c8dd973d5374d4c158"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4746.0.0-darwin-arm64.tar.gz"
      sha256 "06e23af78fba3301d415ee21c77bc4f0a6004fe832bda62549968d1c16246607"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4746.0.0-linux-x64.tar.gz"
    sha256 "fa6a0d99da386c2ee746109c592017ff4b3c28d6b86ec117e1016e8ee7a8b4ad"
  end
  version "4746.0.0"
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
