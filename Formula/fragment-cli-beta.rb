require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2372.0.0-darwin-x64.tar.gz"
    sha256 "66c141552ab9721ad603a003b46c8015e0ec33f1ed7606356f35a54ee76906a7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2372.0.0-darwin-arm64.tar.gz"
      sha256 "7b50c90ec518b4ed99d672bcff09fc42b94c7970e68df850b83bd7fc2e891b06"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2372.0.0-linux-x64.tar.gz"
    sha256 "f86043b144141a40b3bf710b4acec429f3409c0f3f53e97e1765c739cdafd34a"
  end
  version "2372.0.0"
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
