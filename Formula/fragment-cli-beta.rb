require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4373.0.0-darwin-x64.tar.gz"
    sha256 "a5b5621e93c8ed45226ed1c832625e09bf97bd7c56d57f086d5bd80a24d24ff1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4373.0.0-darwin-arm64.tar.gz"
      sha256 "79f4c2d854c28fba374ac65736a4eee01467272efa93c647347e9f4a7c21e277"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4373.0.0-linux-x64.tar.gz"
    sha256 "c7a454c748783a05e3093af5b19ef9ac470203d1afd08c62fec031b44270ce43"
  end
  version "4373.0.0"
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
