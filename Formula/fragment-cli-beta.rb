require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5470.0.0-darwin-x64.tar.gz"
    sha256 "d376c9cf8f8e935c07fe1bd884235c7d06c8a999551e21b96ed5b16a595c8360"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5470.0.0-darwin-arm64.tar.gz"
      sha256 "7051f34d01c43eccffaba9008f9693fb6f113bca5e32ea0bfb49ddd40031fc75"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5470.0.0-linux-x64.tar.gz"
    sha256 "46e883919ce19799e5188e7ae6214282d0ed6d887e2d294a5dbddb1444f1e87e"
  end
  version "5470.0.0"
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
