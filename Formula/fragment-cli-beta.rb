require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5396.0.0-darwin-x64.tar.gz"
    sha256 "d9bfd2b76f8a0ac78b7d3885bfbd4a47e1508680dacb48c63d61ab398c2b7a0c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5396.0.0-darwin-arm64.tar.gz"
      sha256 "9dc5614781cbab7b76f8d87a263f179a997cab76cbc4c876f45ad1f4d3441b13"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5396.0.0-linux-x64.tar.gz"
    sha256 "008f3cabdfc49b4e0e8c041c8f0506612d7e766ca986eb74ccd3d8e0f8c9ab40"
  end
  version "5396.0.0"
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
