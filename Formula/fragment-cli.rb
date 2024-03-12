require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.11-darwin-x64.tar.gz"
    sha256 "188cb1e0e94b92204175d52f5be11ffa63f5e78c2d0460b9348d923f27686ff4"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.11-darwin-arm64.tar.gz"
      sha256 "65e4c5e61219738ff0ac725874639cba29c264d85b9311fe699695926973651e"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.11-linux-x64.tar.gz"
    sha256 "4eb16b2eee22cce43380027296cef73638416294265c1b6016c309eb2a4f0695"
  end
  version "2024.3.11"
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
