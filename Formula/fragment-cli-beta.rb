require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3841.0.0-darwin-x64.tar.gz"
    sha256 "72936286becccc0e5a0b21acac337ae686e72c0198636db344e33790f41f3ccb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3841.0.0-darwin-arm64.tar.gz"
      sha256 "5e0de480e0b6c250acfc5a889b8c4ba4ad7ac8298815701a6f5735eee8842674"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3841.0.0-linux-x64.tar.gz"
    sha256 "05a4cd099248334c5a4cdc1423c1db60e1150e8b6cbe8d7586f3cf99785652a8"
  end
  version "3841.0.0"
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
