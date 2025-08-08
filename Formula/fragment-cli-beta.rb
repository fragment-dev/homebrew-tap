require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6937.0.0-darwin-x64.tar.gz"
    sha256 "a6801f6824b6f649f560ffa37dbb8f1cdb3712ed99f397a8135e7bf141e7a78d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6937.0.0-darwin-arm64.tar.gz"
      sha256 "3572c21b4bcb2a073f3f9183021ab5036a360629a66cca3764fe6e47c0eea31a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6937.0.0-linux-x64.tar.gz"
    sha256 "0cf5d457558232578d0f8415e178c43d8f019e730243abc23969a6ed1cf1dbf3"
  end
  version "6937.0.0"
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
