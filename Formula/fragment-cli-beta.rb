require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5410.0.0-darwin-x64.tar.gz"
    sha256 "792c4d18afbe5d93118f170d7a14b608b0d83e6b00a09220d7b5c7ebf4bc2235"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5410.0.0-darwin-arm64.tar.gz"
      sha256 "3978995e02f4d0625077f64b0656aec1bb3e948b2a3abd8f4511cbbd20ab9c43"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5410.0.0-linux-x64.tar.gz"
    sha256 "d132e9ac51938a6e42345cc81e2b26d5f5a51a91af3cf3120a86e9dbb2ab6ab1"
  end
  version "5410.0.0"
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
