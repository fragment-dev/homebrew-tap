require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5420.0.0-darwin-x64.tar.gz"
    sha256 "e0dbb952b58f2034e80a305871dad038def9e525ec42c738a7fabf1e81aa5dec"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5420.0.0-darwin-arm64.tar.gz"
      sha256 "0563516d3c7233a4999f4010665114e5c3ab2e65d67b6131927415daf941bf7a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5420.0.0-linux-x64.tar.gz"
    sha256 "ad675c83aff4e27b50aca2694e805b371dd5499c4e3118ad3d4b1ae8d216fdee"
  end
  version "5420.0.0"
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
