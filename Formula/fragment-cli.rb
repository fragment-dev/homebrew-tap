require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.7.3-darwin-x64.tar.gz"
    sha256 "93bd96f4f9f47daafa2968e59e9f7a0e66be9e3ead69bdb7772cd4c18ddc1fcd"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.7.3-darwin-arm64.tar.gz"
      sha256 "d3175b7ebe57a9dfc56ecd4ca1167e5e9241ccbf06b33e3a693253e62a83c718"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.7.3-linux-x64.tar.gz"
    sha256 "bb3e9eeee2110965bf3fa6ac9be4ebc5763118a35da146beb84ff451e3a10491"
  end
  version "2025.7.3"
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
