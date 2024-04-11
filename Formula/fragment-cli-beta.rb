require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4871.0.0-darwin-x64.tar.gz"
    sha256 "c71b872e74bba109192a5a1f41162548140d7811352dc3bc2b7aedde42af0f88"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4871.0.0-darwin-arm64.tar.gz"
      sha256 "1f077f73f5ebc6aa765524cc912d1a8c9aa162162c9992ed230f08b683148654"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4871.0.0-linux-x64.tar.gz"
    sha256 "9a48dc4f5551c3e6993c47bbb28a8fec1a257bb3cc3350de87a3034888636031"
  end
  version "4871.0.0"
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
