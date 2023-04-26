require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2529.0.0-darwin-x64.tar.gz"
    sha256 "881a32eb0933e0f8bb11df9ded3e4a15b78d98c5e60c055f9864d488512ed6ad"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2529.0.0-darwin-arm64.tar.gz"
      sha256 "d23f9c6eb20e9ffc7a0380978d01e7c9b82fa2fd8cd95218585255e7ffc5300b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2529.0.0-linux-x64.tar.gz"
    sha256 "0dd8331abdf3fdb557d92ab2891a2d2cdf2544977fef747a2021576cb6834f57"
  end
  version "2529.0.0"
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
