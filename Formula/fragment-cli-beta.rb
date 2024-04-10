require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4863.0.0-darwin-x64.tar.gz"
    sha256 "53ae28a9d85f7d5a7c6cd3483daa6b81546eeeb3aba929e218b4e2071781da92"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4863.0.0-darwin-arm64.tar.gz"
      sha256 "76206fd6e339c0ec321a56ae59762e8cf5a8c8ed10dd5986e5679e33fafdf919"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4863.0.0-linux-x64.tar.gz"
    sha256 "58b9aad6f9daa5d6521aa2115fa04834b7adc05dd79060481e9fdebfb731fa34"
  end
  version "4863.0.0"
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
