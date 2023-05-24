require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.24-darwin-x64.tar.gz"
    sha256 "5a6999b81e85a491c6dca8a2ee7f04b40f6c5623aa00847cc0889032be9a9ef7"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.24-darwin-arm64.tar.gz"
      sha256 "85323326ae6405d28ee022faec2c468310c6dcb9be9f277dceff57a7262d3c0a"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.24-linux-x64.tar.gz"
    sha256 "e48d1b87a5f2380d5a34160730e6625e570b2329cd80c27ea8df969f8293331e"
  end
  version "2023.5.24"
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
