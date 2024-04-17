require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.17-darwin-x64.tar.gz"
    sha256 "08b6df86576763617eb5368086da645ae0c2711d5428190abade6217c56a4e7c"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.17-darwin-arm64.tar.gz"
      sha256 "e2b71b1ed32640f83d044876dcaf78b9cefb8754badc708b5cc7424f28d80a41"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.17-linux-x64.tar.gz"
    sha256 "4fd8bc64a5fb4e887995b8c4e1ddda2a34caf095824f667aeea2bde532cd7b85"
  end
  version "2024.4.17"
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
