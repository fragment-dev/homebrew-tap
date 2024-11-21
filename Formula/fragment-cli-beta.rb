require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5815.0.0-darwin-x64.tar.gz"
    sha256 "b6548983b72adb62481c4ae7bd37f55e5c585240ac3fb4520bd17c9975f422c5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5815.0.0-darwin-arm64.tar.gz"
      sha256 "867e97bf220a36794df4b7cc5d96b2baebc2112952b2c7d30ec2ef5920f320ee"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5815.0.0-linux-x64.tar.gz"
    sha256 "8de14f5a2246e66f635d2388451d0908b771a7c16e324208cc233dbce2490396"
  end
  version "5815.0.0"
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
