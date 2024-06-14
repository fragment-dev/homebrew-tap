require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5282.0.0-darwin-x64.tar.gz"
    sha256 "725bb3a75bda8e7f9c66a197f858cc03c33f3188f7acd8682cdfbcb64301ce2c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5282.0.0-darwin-arm64.tar.gz"
      sha256 "5391decc1787c2456c013a8bdd3b5c3c973bb935ba5875420dea8c874921e67b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5282.0.0-linux-x64.tar.gz"
    sha256 "9c539140a70046111f82a46e2c5faf90edde216dcfbd27d907acedcc403775af"
  end
  version "5282.0.0"
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
