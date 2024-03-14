require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.14-1-darwin-x64.tar.gz"
    sha256 "3adfebaf73fb6f5578f65c52e045cde4f70ed8e73a6f8ae77de52a01e24f7825"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.14-1-darwin-arm64.tar.gz"
      sha256 "d37afdc5be698cbfa727b12b77a60ba1c203ba7a7d9054753272f4532139e1ed"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.14-1-linux-x64.tar.gz"
    sha256 "cb86969091a553d2ee5f567155d81f4f0a0f0f198c98951644e7f4bd04b6ef0e"
  end
  version "2024.3.14-1"
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
