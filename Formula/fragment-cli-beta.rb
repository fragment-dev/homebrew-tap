require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5547.0.0-darwin-x64.tar.gz"
    sha256 "9d1046e48b4ba7797f1a167ffd2a33a475e056cdb5eb3d379173d1ba0b9735b1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5547.0.0-darwin-arm64.tar.gz"
      sha256 "82fe1cb19e525cf3ad3c9a86052c1002311d286008cd1e564661214a89fba78a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5547.0.0-linux-x64.tar.gz"
    sha256 "f8dde24c0671fcf13ecbbbada6c1c64de3f78950cf1033df492a51837196bfb6"
  end
  version "5547.0.0"
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
