require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2985.0.0-darwin-x64.tar.gz"
    sha256 "59c7d7f912f19423a310342e4a5f3c16fe3fb21cf9a15633af410cfe249fd11a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2985.0.0-darwin-arm64.tar.gz"
      sha256 "184064973d9d18d3b7de1a11cca8a4b06d1b49afb47a712ea220fdbaa653bd00"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2985.0.0-linux-x64.tar.gz"
    sha256 "b1786b0755d1e63bbbc8e945d5f62c9f6ff714e6a8a3dbcea7c46eecc2511572"
  end
  version "2985.0.0"
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
