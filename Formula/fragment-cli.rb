require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.18-1-darwin-x64.tar.gz"
    sha256 "e23ca1560326b461aa93600dc6d3be25b5f81eef07b08006e8f39ea3a0c2dc43"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.18-1-darwin-arm64.tar.gz"
      sha256 "77a1534a0bed4acaaf1b222a0c0ed235f32076411f3407266f3c0d7b3c4d616d"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.18-1-linux-x64.tar.gz"
    sha256 "a611b5fdce36601c1a04d93b4495c4171f30873be767f6acaeb47ca036d8ca29"
  end
  version "2024.6.18-1"
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
