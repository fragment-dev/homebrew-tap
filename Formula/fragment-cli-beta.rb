require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5732.0.0-darwin-x64.tar.gz"
    sha256 "a6c2800ddbf85e1067e35e7d4bdd6f9d3a326fd591a30babfd007137a8bfc1e6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5732.0.0-darwin-arm64.tar.gz"
      sha256 "a3d2128d07d63602281bde37f1e5e4aa7b7353b1e5cf56c6655600d2f81d765c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5732.0.0-linux-x64.tar.gz"
    sha256 "fbbca786b5c6ccf32d7c237ad68b2983c184d609915e26fc8abf650e4c5ab632"
  end
  version "5732.0.0"
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
