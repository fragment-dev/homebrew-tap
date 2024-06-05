require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5207.0.0-darwin-x64.tar.gz"
    sha256 "8176bf37a36ed18ceb943feda9b273ba0a93a80d5d3658609385672a7cff6165"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5207.0.0-darwin-arm64.tar.gz"
      sha256 "af52550aa2fc7222247059967369e87e29e499fdfec5b3cbe8a6bd656773cfad"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5207.0.0-linux-x64.tar.gz"
    sha256 "ebd9f380e6d17f02e870b0300dc405a9e7704b9850313cab6e57aa79cb3aabaa"
  end
  version "5207.0.0"
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
