require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.23-1-darwin-x64.tar.gz"
    sha256 "6535d03e3929e3ad752618a73c1b30f69e7afa5e7c8701b2ff21c270a4bba59c"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.23-1-darwin-arm64.tar.gz"
      sha256 "46115c5c7a08990a80c678e4931624215312cffd4ef6bf5532d746c47e917b45"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.23-1-linux-x64.tar.gz"
    sha256 "2935c0673f14966f9e4e97378fcd95172c54873d570fad2153b99e3b6a0e686c"
  end
  version "2023.8.23-1"
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
