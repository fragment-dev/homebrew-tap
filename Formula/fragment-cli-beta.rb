require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2912.0.0-darwin-x64.tar.gz"
    sha256 "e8313a3a3d4738ddb1d2615633e9692bde4402e9471ee44837836acce0414509"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2912.0.0-darwin-arm64.tar.gz"
      sha256 "6e5b538551f91ce2fcf354ff94e1a05e9bcea7716181fd04a62044ad37037d30"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2912.0.0-linux-x64.tar.gz"
    sha256 "33a99310cf2d7b7138bdb03f28bd0cfabb58355335e2f1b3bd1e20dd8a8af46e"
  end
  version "2912.0.0"
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
