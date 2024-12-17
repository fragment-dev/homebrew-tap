require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.17-darwin-x64.tar.gz"
    sha256 "e91b657db7ca63758a297f6fc8b06e6b4c74e0cb7b7f6fa4b54147e14f074fcc"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.17-darwin-arm64.tar.gz"
      sha256 "f86bbe3000514627b4acddc28ed16e29e9cc2593be1d1dac740163d52114118f"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.17-linux-x64.tar.gz"
    sha256 "8caabb5add1d6270a600b5225fc954f02ebc092d33e127da8f9f7b95f9d58e7e"
  end
  version "2024.12.17"
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
