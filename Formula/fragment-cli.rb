require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.21-1-darwin-x64.tar.gz"
    sha256 "75425d66cb2b5f3a79835e775311497a2f68131a71bfd1c61cadb4d0736db65a"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.21-1-darwin-arm64.tar.gz"
      sha256 "bc20e90061796905c0a1965af86fcfcc58219d3f8e1fc056d775d0d90b9ce516"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.21-1-linux-x64.tar.gz"
    sha256 "157817de05a2343d024d091794f999ab500a13fe646b3a2c1f5d54cc04d04027"
  end
  version "2024.12.21-1"
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
