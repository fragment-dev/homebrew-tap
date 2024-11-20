require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.20-darwin-x64.tar.gz"
    sha256 "272137722e2952082987730fcb2494ac4b6c27b920b7381f910ceb63d4d1be41"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.20-darwin-arm64.tar.gz"
      sha256 "ccd5d2ab1594f826ac94a0ef0e461dcf059fec988c858ac0790296c19d646fc2"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.20-linux-x64.tar.gz"
    sha256 "a750e958e6d70ce2732e8e4ce75a3c26e2b01a7fdc270505bb4eb228d6156d9b"
  end
  version "2024.11.20"
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
