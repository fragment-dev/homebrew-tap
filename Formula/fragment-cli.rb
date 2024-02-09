require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.8-darwin-x64.tar.gz"
    sha256 "9ef4f170e355ff79385be72a4961e419fb59052de3c65eaf2c207f2c8f483899"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.8-darwin-arm64.tar.gz"
      sha256 "3efa492bf650762969e4e5083f53464200bc9fe493f4c063ac6f14ccd75763f4"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.8-linux-x64.tar.gz"
    sha256 "a9b76d79ff6157e68459929f543c108359293790cfc03862d08a7b287bd50fc4"
  end
  version "2024.2.8"
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
