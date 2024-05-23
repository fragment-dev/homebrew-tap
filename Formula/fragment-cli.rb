require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.23-darwin-x64.tar.gz"
    sha256 "5cd445493fff2591722e31d5ff30048ce9ae03e391f2c7ff6b3acd32383e5fc7"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.23-darwin-arm64.tar.gz"
      sha256 "f8c7b5a89fd1a2a710757375a2f30b7289d4b699264954f8afda84296d69c899"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.23-linux-x64.tar.gz"
    sha256 "55aec7a0452b3e95fd657a16cdf54804f1ff30a3390db1719240ef0461986e42"
  end
  version "2024.5.23"
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
