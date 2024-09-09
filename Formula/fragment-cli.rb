require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.6-darwin-x64.tar.gz"
    sha256 "0fe3b8c1c60cdcb6bc342860105e87c1d7b18ceae70af7f18494a300302f5120"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.6-darwin-arm64.tar.gz"
      sha256 "3348782708a5023ae3c0d2c0aecba96c5f852301a668ea720333f91f059d325a"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.6-linux-x64.tar.gz"
    sha256 "babcdd3adfff258e16c413c4d77058d3aa29488067b8deb345f71afa7baccc04"
  end
  version "2024.9.6"
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
