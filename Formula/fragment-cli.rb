require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.17-darwin-x64.tar.gz"
    sha256 "dee939a37e49a6d2422b5515f4cbf7583603f81d89ae9cf33a9fa5a87e037b14"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.17-darwin-arm64.tar.gz"
      sha256 "989d834cf67348846b4fa8478adab5d0a3d53b7f15ec7288797f9225b3e4cbc2"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.17-linux-x64.tar.gz"
    sha256 "146a8a9ae70415554a7c34a90c2b2ace986f114c4bacc11f60ce37a6b8b605e5"
  end
  version "2024.6.17"
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
