require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5362.0.0-darwin-x64.tar.gz"
    sha256 "04f6b5d68a93aa2b2a48dc1003e562e24a439cf9ebc8e15bdd970fd14748b45a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5362.0.0-darwin-arm64.tar.gz"
      sha256 "8cef5a6248dbf3135e60d3a6f5c50de9acefb1ba875d82b320502c69fabac746"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5362.0.0-linux-x64.tar.gz"
    sha256 "9a24b6ee34e91fc991e7c0da55d0b325b1b3178e85e99d5e9dd9ef8519d57c00"
  end
  version "5362.0.0"
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
