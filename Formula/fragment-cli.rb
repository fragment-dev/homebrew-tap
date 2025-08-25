require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.8.25-2-darwin-x64.tar.gz"
    sha256 "6c7c53eab0aff7857cb74abfa4df66bcc2b15ef043e65459cba8b88a5d86bd6f"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.8.25-2-darwin-arm64.tar.gz"
      sha256 "9451431dbc2cf78ff3e2b3eaa0101858b71e6d4b12d067fde472574283c0d1b7"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.8.25-2-linux-x64.tar.gz"
    sha256 "40ae779419abb04275548ed3150762ee5de9f515f23db332779fa8f35cdc13ce"
  end
  version "2025.8.25-2"
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
