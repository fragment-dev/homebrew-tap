require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5521.0.0-darwin-x64.tar.gz"
    sha256 "0e8b67a6a7caf99faeaeb9aa865f387c8787ba5af031895a8714c8c0a1ebd93d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5521.0.0-darwin-arm64.tar.gz"
      sha256 "82b08d2c543fa434de21dc7bc77fe3cff29a8b330554ea0aca068865d05912be"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5521.0.0-linux-x64.tar.gz"
    sha256 "9b0fe9351b39616572e7c0dbbdaa7a5b1b9c840f9881ce41bd7d6f74814a5589"
  end
  version "5521.0.0"
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
