require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.31-darwin-x64.tar.gz"
    sha256 "ce4e686bc31d707cd3a04191ec4f4b84e907585c909ec7a38a2e2b2816c2e81b"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.31-darwin-arm64.tar.gz"
      sha256 "599f5e3323df654518987f15f8a856e347c702cffe9eb4634f8f49271ad351ef"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.31-linux-x64.tar.gz"
    sha256 "d477cb97e56036f027a530f8bd452e38ef1031926142d1d3b09588f5e6d2c0c3"
  end
  version "2024.5.31"
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
