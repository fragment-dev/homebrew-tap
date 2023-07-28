require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.28-darwin-x64.tar.gz"
    sha256 "ba1ab10cc82debf95eb4fbe807c71799cf4b9fb4981632753335349b5f528dc1"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.28-darwin-arm64.tar.gz"
      sha256 "a3eda1df1e050393cd031cd4e5e26bff090af808ea58170d05c4cc404af719a1"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.28-linux-x64.tar.gz"
    sha256 "5bc7efca161cb9f5eed354dc129bdd9ffc0b0c8dfd54fbd3a796855a4912642c"
  end
  version "2023.7.28"
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
