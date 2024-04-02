require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.2-darwin-x64.tar.gz"
    sha256 "5e1ab3bc69b60a4b7f1065218d3d00cd5a8541646cb13996180b26c23211f089"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.2-darwin-arm64.tar.gz"
      sha256 "d05ba7304437d6028947acbc39faa46310703fe9043f84674a0b51e922f89bf9"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.2-linux-x64.tar.gz"
    sha256 "cb404055f9b0434b6159972cc19a05339a9924f9bd941315fc9d69563ca178e6"
  end
  version "2024.4.2"
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
