require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3372.0.0-darwin-x64.tar.gz"
    sha256 "5b681c78cdbdd1c588f4b833d4e24f60a88ae371d607b575123c2f64e8585989"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3372.0.0-darwin-arm64.tar.gz"
      sha256 "60bfb6860696a586bf0e1d0e69a7f8f7eca8859123906f909c84cf46e96215f2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3372.0.0-linux-x64.tar.gz"
    sha256 "49febaf875e5910d77f781725ae5aec1244b7f78a75aa592822621a78b7c120c"
  end
  version "3372.0.0"
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
