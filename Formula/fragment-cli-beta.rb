require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5412.0.0-darwin-x64.tar.gz"
    sha256 "fb7cefe88bcf4d707bd8cd82a39d46d6019108f7624ecc72faddc73453c178a0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5412.0.0-darwin-arm64.tar.gz"
      sha256 "79040d08adef98533a048ed4d584611eaea589dfa09af3bb6e02e2b860008830"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5412.0.0-linux-x64.tar.gz"
    sha256 "03054ae5ed2b268f47bec2a3a0cdbf685dbd07d270f41535c238e18c9053f67b"
  end
  version "5412.0.0"
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
