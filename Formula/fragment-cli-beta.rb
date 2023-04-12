require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2419.0.0-darwin-x64.tar.gz"
    sha256 "68b56b1d00ba99778da653e93ba61f4971643dbb5770f6b20a5f4d9342aa72b3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2419.0.0-darwin-arm64.tar.gz"
      sha256 "ba6d20b0d0000cb600afcb700ceb8ffda9ec7afda8bce951a0507fcbc0ed14e8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2419.0.0-linux-x64.tar.gz"
    sha256 "792de3078687e4732d7c2cd0acb3a734a1e777044cc9ce7ca9f895b13f7fb41d"
  end
  version "2419.0.0"
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
