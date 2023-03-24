require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2277.0.0-darwin-x64.tar.gz"
    sha256 "506e58fec89cd98928e855d1777b2a8aa540d57e7469e2b633e41bf0d7f5da37"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2277.0.0-darwin-arm64.tar.gz"
      sha256 "94ce19d2ac2c403395944b60b8c77dae5f284c2871c89557376cf818d78b5c22"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2277.0.0-linux-x64.tar.gz"
    sha256 "e0d5521b3b78ba28e98ddbcc139882d58142631209a5cc1e344b260aa132d339"
  end
  version "2277.0.0"
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
