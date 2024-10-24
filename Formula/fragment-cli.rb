require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.24-darwin-x64.tar.gz"
    sha256 "d528bec27063ad24176ce60d8374ea5eef8410384544c0988ab78c2aee573837"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.24-darwin-arm64.tar.gz"
      sha256 "01f3f9c47a7af147cb4fd5c263028be196636c043769a6b1e6a7427a17622435"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.24-linux-x64.tar.gz"
    sha256 "e6809dcf0e48cbbba5570ab970564a00d6f01363e9d1cd0a48f371f528a63050"
  end
  version "2024.10.24"
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
