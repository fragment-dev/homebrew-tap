require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.16-1-darwin-x64.tar.gz"
    sha256 "212a27522cde018de6f9cb2a881416c88a45cd4a3bf60be3fd69583ce6d2a618"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.16-1-darwin-arm64.tar.gz"
      sha256 "d24bb4bf0dbdbe741ed2e638c8d531dca3034383143fb7a04366f33b66411bee"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.16-1-linux-x64.tar.gz"
    sha256 "ba56d9bd4d6bcf7c7c5e18749b6e63cca9f6f663043cb3fe25110867312d2991"
  end
  version "2023.5.16-1"
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
