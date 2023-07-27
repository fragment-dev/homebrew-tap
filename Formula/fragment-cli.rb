require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.27-darwin-x64.tar.gz"
    sha256 "17bfa3bc9ff3e7013c210040d9754a1e0ef67869ac2fbfcd5abc7a0efaa4828a"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.27-darwin-arm64.tar.gz"
      sha256 "eebcfed05ec029e0cbad1c36fa81a62abfcc89b25f3caeb6fff1eb0098b57d4a"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.27-linux-x64.tar.gz"
    sha256 "5463ea3312153ef8ecf43a88583a535ebda6ce8535ba8c51ba34d33545f7b27c"
  end
  version "2023.7.27"
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
