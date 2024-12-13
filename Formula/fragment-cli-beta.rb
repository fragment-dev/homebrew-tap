require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5880.0.0-darwin-x64.tar.gz"
    sha256 "607a815c73696acf1cf085d67f29c71d0ad28f988a2fe83d5f92643d9ccfc88a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5880.0.0-darwin-arm64.tar.gz"
      sha256 "d6a8cef636e098227a97579258046d3cd9cbdc426b08bb3fbc5aa8fc48b6d9fd"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5880.0.0-linux-x64.tar.gz"
    sha256 "bbe29f073b1a9561bc26181359a89e67ced711d4ff2a1428286da34eabdb9f39"
  end
  version "5880.0.0"
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
