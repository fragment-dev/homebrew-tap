require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2390.0.0-darwin-x64.tar.gz"
    sha256 "39d45787c9f01d9b57ae200f2984c55f30a04b3772699ce5813a40fb37d9cf92"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2390.0.0-darwin-arm64.tar.gz"
      sha256 "916f51ff079d3166841db206a71e4771643535e98527f68394299f24d3f1a80c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2390.0.0-linux-x64.tar.gz"
    sha256 "918c3f4f75c4ee973fd56173919920d353561b3e14c352e6c4a44b7a7d1779cb"
  end
  version "2390.0.0"
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
