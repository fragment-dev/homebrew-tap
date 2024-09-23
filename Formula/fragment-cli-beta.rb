require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5615.0.0-darwin-x64.tar.gz"
    sha256 "2ab351a933a45c6ac23e00d1382a9cb0831b3a6b3b9d36821e630e0927404980"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5615.0.0-darwin-arm64.tar.gz"
      sha256 "107b5c11a422f72b03409e01bf97db2ee2349270feffff1a084a98b15b737a41"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5615.0.0-linux-x64.tar.gz"
    sha256 "5ddfcf832e622de51b683a8aee331a7b4bf55b45100134446b46206497c50c52"
  end
  version "5615.0.0"
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
