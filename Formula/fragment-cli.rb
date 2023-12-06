require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.5-darwin-x64.tar.gz"
    sha256 "0d9c21be7aeb5a260c069706c8f61a6c6a4013d8d45354d0e7277e8338ce8419"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.5-darwin-arm64.tar.gz"
      sha256 "489ff6edf11fd656369be3d54f6c372ad0bd151e498fa274ed9e24ab334c6e3a"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.5-linux-x64.tar.gz"
    sha256 "8545a02dc23fee578f0ab44bc9ab063012d175b422fc914c7d2dd1977f26d8e3"
  end
  version "2023.12.5"
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
