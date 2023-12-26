require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4213.0.0-darwin-x64.tar.gz"
    sha256 "ab5a408a971bc38cdf4da8e15afa57ef85f2f99d522c055b5295750da5cf5fd6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4213.0.0-darwin-arm64.tar.gz"
      sha256 "94c0488903d3978028de025f96792766bd3504bda827bd0e1e8b5113c4a08110"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4213.0.0-linux-x64.tar.gz"
    sha256 "33f7819e700159b1750da5394f9b633f35dba138f719cae407602e13a2a8cca4"
  end
  version "4213.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
