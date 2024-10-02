require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5639.0.0-darwin-x64.tar.gz"
    sha256 "0700df2238f9ca615aba13a100902a3a36a8424c8decb463dda882e7ab901ac7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5639.0.0-darwin-arm64.tar.gz"
      sha256 "eb570e10bab718ecadffcb570b544f0f1feeba0eb5074073ab38450038e0e646"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5639.0.0-linux-x64.tar.gz"
    sha256 "27bca1832d6bb2a324f373adcce0adb2289a741af52762c46f8c4db9b1829b59"
  end
  version "5639.0.0"
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
