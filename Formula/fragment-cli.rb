require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.26-1-darwin-x64.tar.gz"
    sha256 "aed6c0f9786341af311b0c39870515b6eb6688cacabaff17d39b32c94a03e0d7"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.26-1-darwin-arm64.tar.gz"
      sha256 "cb9ef2d92ba5c0f417fc4886a23bbb73ecc1f7ea30e9c9dbf992929bab9b302d"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.26-1-linux-x64.tar.gz"
    sha256 "ccbf3b39b54b0173c7c67e4ad000d102f9c63875dca5af247d39a48f9a9e4d9c"
  end
  version "2024.1.26-1"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
