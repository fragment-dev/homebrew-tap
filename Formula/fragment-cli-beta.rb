require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2897.0.0-darwin-x64.tar.gz"
    sha256 "d7dbec1fa6fa99da6797d360cee9204645c528039b097addbe7632a1d067e0e0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2897.0.0-darwin-arm64.tar.gz"
      sha256 "4b62c599f09ff7300ce53eb3a91af47eb5b62c40cdef3ae79bfa8d3986b49906"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2897.0.0-linux-x64.tar.gz"
    sha256 "1d3e0f5f4b354cfc2c126636674305a37930d691a7fc7802e574e136c8e7bcef"
  end
  version "2897.0.0"
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
