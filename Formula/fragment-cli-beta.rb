require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6065.0.0-darwin-x64.tar.gz"
    sha256 "8d3ab4858633a1d9f2b75a476bd9428cdbf3429401c6011343bd3ca8172c00a0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6065.0.0-darwin-arm64.tar.gz"
      sha256 "9e8ee3b41d1758749c673d105516c5e769913cdaa695265874dde5924eb82908"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6065.0.0-linux-x64.tar.gz"
    sha256 "1828a1144fbeba60fc8f66e408c6bf3c15a19f807e686d9748c4f837475181f7"
  end
  version "6065.0.0"
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
