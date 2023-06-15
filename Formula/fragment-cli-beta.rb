require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2856.0.0-darwin-x64.tar.gz"
    sha256 "d216080a6ed31041041e7a0b564345853ec0ba1579d101398256ce6ca61a462a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2856.0.0-darwin-arm64.tar.gz"
      sha256 "11c151646f3a01b0e18d7a3390942346352eccea4ed278320ba96c263b22fe77"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2856.0.0-linux-x64.tar.gz"
    sha256 "fd89282b083f14f02032af566824bf5224fee45f4556c30b29255146a8487832"
  end
  version "2856.0.0"
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
