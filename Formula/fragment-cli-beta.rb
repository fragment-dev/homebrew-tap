require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3995.0.0-darwin-x64.tar.gz"
    sha256 "86c8a73b78c30919cacd69018198fb30a26b8d043e3c7d4c47e36f401c7aaa02"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3995.0.0-darwin-arm64.tar.gz"
      sha256 "9f40a8bf5f252d8d7d04c6eb80fdb49e7686b2af646939c01a7fd3273afdc229"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3995.0.0-linux-x64.tar.gz"
    sha256 "eca71cf298eb5e4662de75fb1a63fc6c69e6dcb14ca90d1535467d894e9d8071"
  end
  version "3995.0.0"
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
