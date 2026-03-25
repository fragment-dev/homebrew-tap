require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v8121.0.0-darwin-x64.tar.gz"
    sha256 "2c0e0d2387afff70a82f97815671487fcd54d4519c94b695ce20c7c7e080c45e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v8121.0.0-darwin-arm64.tar.gz"
      sha256 "ebf26c3c3f7b86511c6c7492ec6b3bdb9d69616cfea3b13b15c10afde3b8d977"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v8121.0.0-linux-x64.tar.gz"
    sha256 "2e38a2712e2f843784eac26206b58f5ca128e72d4fe655ff24c62b80f97abcf7"
  end
  version "8121.0.0"
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
