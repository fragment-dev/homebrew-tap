require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2473.0.0-darwin-x64.tar.gz"
    sha256 "845a9d44ed558a2548fd5a7af1bb98eaf909430937c18eb51d7feeb083788bba"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2473.0.0-darwin-arm64.tar.gz"
      sha256 "3beec30caf122d7b79c9ab4e32ef05d4a8801fad4860add4ab0c3c32e5c6df28"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2473.0.0-linux-x64.tar.gz"
    sha256 "e1b91c33bbcad94dd00cd16da3228a71ec6d8083c44f85a8079d6e4ac551e0a7"
  end
  version "2473.0.0"
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
