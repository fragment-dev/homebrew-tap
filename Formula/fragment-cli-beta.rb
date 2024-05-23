require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5112.0.0-darwin-x64.tar.gz"
    sha256 "83076d0c301edadc763f9f67c5a729daaa9127cbb3bf8c1ec12b39533c1a7379"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5112.0.0-darwin-arm64.tar.gz"
      sha256 "5d79824ff3321ab7fa078d7248d53197c21e16547eb6eec2c4fb879f912e9051"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5112.0.0-linux-x64.tar.gz"
    sha256 "1e653f19292716d3eca036c97a319f867f83559fb698c8a013cd950ded9972db"
  end
  version "5112.0.0"
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
