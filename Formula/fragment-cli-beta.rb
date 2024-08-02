require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5464.0.0-darwin-x64.tar.gz"
    sha256 "852ea82b2b55c76a088abe5c5a35819c26d69c970ff299653fdb851e95ece0d7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5464.0.0-darwin-arm64.tar.gz"
      sha256 "78bdd7f01b9407c54d740796ad2f7150a6571764e891c114f9b0633ff530fd69"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5464.0.0-linux-x64.tar.gz"
    sha256 "075a7d39770155ee991d17bb8b0e9961046a93bd491c843cdf967de642d7e703"
  end
  version "5464.0.0"
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
