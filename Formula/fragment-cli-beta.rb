require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4922.0.0-darwin-x64.tar.gz"
    sha256 "cb4712f3602b5dd636099ca50c9ff53ccba555985b45039b956707759f5913c5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4922.0.0-darwin-arm64.tar.gz"
      sha256 "43af1d2f7f400f6f79d8bf409505de5b7f8448680ff359dadce02b104d057edc"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4922.0.0-linux-x64.tar.gz"
    sha256 "482423017466c66e95b4808f77e7bda60257b4184f3c481331aa7a1bee9ae329"
  end
  version "4922.0.0"
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
