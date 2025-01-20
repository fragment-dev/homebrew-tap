require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6099.0.0-darwin-x64.tar.gz"
    sha256 "5aecb1dd126582963074fee50e4f283482bdeaf50b9deb82803a68286ca47608"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6099.0.0-darwin-arm64.tar.gz"
      sha256 "794ce7618f2e3959aa22e9ee3d4caef1340567c2bbffef3a91814446e29f5fbc"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6099.0.0-linux-x64.tar.gz"
    sha256 "bdcf7d05e05deca1704b735bb897a25ecabc6144061ed305dc4ef8c34477414a"
  end
  version "6099.0.0"
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
