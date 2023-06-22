require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2900.0.0-darwin-x64.tar.gz"
    sha256 "c7f5a7c32aeff14d2707625e98f85d556c551cf28b2c8ebd2c9fe54ca474a8ee"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2900.0.0-darwin-arm64.tar.gz"
      sha256 "794e0bfb049b7453e11df38bda90959ac4a7163fa4c64f714f7bd779570132f9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2900.0.0-linux-x64.tar.gz"
    sha256 "e355051cfdb64623bbdadadba34add98562881015553040ee2246b6dc1326d7c"
  end
  version "2900.0.0"
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
