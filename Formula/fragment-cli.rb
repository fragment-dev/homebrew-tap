require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.28-1-darwin-x64.tar.gz"
    sha256 "13f771be8a553329e1dc05b778d1fd4e62e44b2bd4ec47ffefaa0aa1160516b0"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.28-1-darwin-arm64.tar.gz"
      sha256 "b57b905cfa5381de558f859e1f0c36946de62bb73617dfacc5b9f4b36a18a517"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.28-1-linux-x64.tar.gz"
    sha256 "95c4fd8bd837d3b8d7ea12861887dc9f73997a69d88e6c7550a1a74d77965721"
  end
  version "2024.11.28-1"
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
