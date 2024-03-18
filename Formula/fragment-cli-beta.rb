require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4774.0.0-darwin-x64.tar.gz"
    sha256 "ba0d929c78ba7c0956142f4ee05673e4ca508b267d935b96cd42b90fcfa8677c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4774.0.0-darwin-arm64.tar.gz"
      sha256 "184001c236f7d28ccd326aa338147c02d95e21eee8680e532cd61ff700af3c0f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4774.0.0-linux-x64.tar.gz"
    sha256 "beb9bb7c0cc030590089d6080285c51bf719cfe1d3358a9a27e4e09abe6846cc"
  end
  version "4774.0.0"
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
