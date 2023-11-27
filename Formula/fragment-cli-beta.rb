require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4046.0.0-darwin-x64.tar.gz"
    sha256 "95150987d8c9e5ec824000bdfcab94747f2b7f05bc858ce9fd2f8719a7a676bf"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4046.0.0-darwin-arm64.tar.gz"
      sha256 "a795f1a7ed929ee97bbf46c67bdc947f01e03abccfd6277c242f90b43ce0e23a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4046.0.0-linux-x64.tar.gz"
    sha256 "aefe30ccbab136ed787fe6b015339d095802c48e9f1e92d3b3a94f932882a394"
  end
  version "4046.0.0"
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
