require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5082.0.0-darwin-x64.tar.gz"
    sha256 "e207b26b10ba36b30f02524237ac517fbdfbc57d203197556245fdfab442dde3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5082.0.0-darwin-arm64.tar.gz"
      sha256 "9eaf00907fd9ad8b3448189b87fa9412c9d0c2ab0b2f0cae2544462cf30f0583"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5082.0.0-linux-x64.tar.gz"
    sha256 "e6dfb3c3780cc81d3fefa21e99b961cdc6344b0f1cfe5e91c683147f1a91873c"
  end
  version "5082.0.0"
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
