require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.17-1-darwin-x64.tar.gz"
    sha256 "fb69775d3be6f71e626ced0952623fffbba65a98dcecbf2a727bffd88603dc6d"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.17-1-darwin-arm64.tar.gz"
      sha256 "e868c90a369442ea58052c76c747a3b535e5d07b6b4f3f6cadf09a6eda4749a6"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.17-1-linux-x64.tar.gz"
    sha256 "b982106df2e33e4cc3e49265211d25953a6792280bb3869949474443d8d1b7c8"
  end
  version "2024.6.17-1"
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
