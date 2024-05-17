require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.17-1-darwin-x64.tar.gz"
    sha256 "0afdf32e65a851ac38128f43c3400b8db86187c64fbf9271bc669df5c652798d"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.17-1-darwin-arm64.tar.gz"
      sha256 "67c951091682760601ee5dfca4126b6173e7c8b82fa1ebc62cb17ac4ebccff20"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.17-1-linux-x64.tar.gz"
    sha256 "0b0b6c61ccb41e8d5bb75811d4df026305fccabae2d9a1aa067d1facd2380fa3"
  end
  version "2024.5.17-1"
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
