require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.28-darwin-x64.tar.gz"
    sha256 "7497f6c601e6ad3ee1d2eec0b422107f801099f2d13f5f871067fa63a338d36e"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.28-darwin-arm64.tar.gz"
      sha256 "a7b473a30dcae10cb339c1e7de427a128ada2c8ce6a49529f3e91a8f9cae12d0"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.28-linux-x64.tar.gz"
    sha256 "209a626731aa61b3dcb1c21008652f780549961ea84630c702856d6855b37d89"
  end
  version "2024.8.28"
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
