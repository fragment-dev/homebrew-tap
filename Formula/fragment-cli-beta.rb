require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5159.0.0-darwin-x64.tar.gz"
    sha256 "2e88e6776bd39d8d389ce3f67d16b72b5f2c9b75b27ae8ae73525b77144469a8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5159.0.0-darwin-arm64.tar.gz"
      sha256 "91f0a5bcc3c1beca70ee946caff434665476d0d84183c2eb3431286449b036ce"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5159.0.0-linux-x64.tar.gz"
    sha256 "52228047f543d03d5e7a1710261b197df4548ba8224e20d1bb2c21f14c20f576"
  end
  version "5159.0.0"
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
