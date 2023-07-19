require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.18-1-darwin-x64.tar.gz"
    sha256 "033ef29f9409670f1535946522183d143d7bd6bc08a1593009c5fef693a27224"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.18-1-darwin-arm64.tar.gz"
      sha256 "508918dde964471a7c280392560157f4a63a1662b799bbdf0e6a385ae5bab0fe"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.18-1-linux-x64.tar.gz"
    sha256 "2f8ce1721336787c1b131c46d6a0a2acaaf715105eb6b758b08e72e58a7bdf46"
  end
  version "2023.7.18-1"
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
