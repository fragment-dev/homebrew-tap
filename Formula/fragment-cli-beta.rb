require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4086.0.0-darwin-x64.tar.gz"
    sha256 "4fd88af9fe5da2de82c6530c6931ee8dd1ada337d7d9f995fa7cd20546be57aa"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4086.0.0-darwin-arm64.tar.gz"
      sha256 "c9974ab758a4782f6255baceb39b129f92def42d6c931ff473eeb6c08b366185"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4086.0.0-linux-x64.tar.gz"
    sha256 "81e7f9c1c9625afa1e3657244065aebc48edfc1c0b2d54f791f0648e9bcea3c3"
  end
  version "4086.0.0"
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
