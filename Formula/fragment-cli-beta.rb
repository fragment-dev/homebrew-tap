require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2883.0.0-darwin-x64.tar.gz"
    sha256 "a279d389564c350d16b515710f84f3a1762203ea447c39057a4c4edd39e5198c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2883.0.0-darwin-arm64.tar.gz"
      sha256 "83ef408fca040961efbebd840f56dc1906e4f2ca46904c757cecc0d2dc39e2c0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2883.0.0-linux-x64.tar.gz"
    sha256 "5383abccaa662ee32af27f435e9b9cde970e0d9eae263f3c912235398137c6e2"
  end
  version "2883.0.0"
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
