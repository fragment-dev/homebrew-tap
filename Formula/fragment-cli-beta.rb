require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5571.0.0-darwin-x64.tar.gz"
    sha256 "6324854f8368c6bbbcc258c7870cf4ae5a0a5c81ec7115e64c3a11ddc720a7d2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5571.0.0-darwin-arm64.tar.gz"
      sha256 "695a67466c2b29dff18ed18e1819a20f69a42d6e3371e2f0a12ed90d7d0aab71"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5571.0.0-linux-x64.tar.gz"
    sha256 "4fbbdbe2c78b901b3f77e12cbec1d8207373d20e2858a60ab9b36de377edcda3"
  end
  version "5571.0.0"
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
