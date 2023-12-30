require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4238.0.0-darwin-x64.tar.gz"
    sha256 "026aec6d5afd99e8b425b5d2bb5c19763679746691d8fa9d3d2aeae320a1d2c0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4238.0.0-darwin-arm64.tar.gz"
      sha256 "4bdb1ee1d99a98dc50cb3002402d8d140c718e818955057166491ccd7026ec18"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4238.0.0-linux-x64.tar.gz"
    sha256 "44d931e517a80ee8d8a931e06aed09df98484b68d1341c086d1d7fb4a0124f92"
  end
  version "4238.0.0"
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
