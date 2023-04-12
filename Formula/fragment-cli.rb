require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.12-darwin-x64.tar.gz"
    sha256 "61fb24bccca783db237e622460de8becc96dd5fb3a4c474858023c30c6619a2b"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.12-darwin-arm64.tar.gz"
      sha256 "5204a07f714f0ff7ea8130fa513fff5cca04b295a6a87e642463b4a83f9361a4"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.12-linux-x64.tar.gz"
    sha256 "8da070b4330b4b14001129e12b08c92ccb01d293e72b5f515f2f82eb14967b4c"
  end
  version "2023.4.12"
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
