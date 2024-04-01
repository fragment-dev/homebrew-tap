require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4826.0.0-darwin-x64.tar.gz"
    sha256 "bdcaa6916d2a775643a377e3f774c5483d4cad9b2bb4870d58f93a82250c6052"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4826.0.0-darwin-arm64.tar.gz"
      sha256 "716ce86edd34ca4331917008fe6135b7f0d08adb839f2a1a3cc2145edfeaf985"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4826.0.0-linux-x64.tar.gz"
    sha256 "389b1a91900dc418434cda14430a17588f3bf3cd5094fb91f7ae22d3dd10e202"
  end
  version "4826.0.0"
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
