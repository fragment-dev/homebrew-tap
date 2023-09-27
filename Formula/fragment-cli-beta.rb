require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3683.0.0-darwin-x64.tar.gz"
    sha256 "f94ac96857d33c81f6019528f8be82bf771a62bc4bd6385c6f73e17d70150079"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3683.0.0-darwin-arm64.tar.gz"
      sha256 "69cf1e1a829b300725253ea59a91fed81a29e4548ce8664c49168efd915dc21b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3683.0.0-linux-x64.tar.gz"
    sha256 "d3e426db2954b0dc8a78144e6e46cffbbb561175fab8a42b1872aedd1e1bdc41"
  end
  version "3683.0.0"
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
