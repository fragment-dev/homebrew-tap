require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4170.0.0-darwin-x64.tar.gz"
    sha256 "976e85d952f367f15552bffa4e130bad7339a0fd3ac223eaf1a74d5ac8b36127"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4170.0.0-darwin-arm64.tar.gz"
      sha256 "2e6c42cdf45c76cc3a6333088ecd015019c57676e5b84b8ef87a23b9e18eb3fa"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4170.0.0-linux-x64.tar.gz"
    sha256 "8161fb5b58a372025191f1115ca7dc3bb5b2ade87c67227bde1e8cd71b02ad07"
  end
  version "4170.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
