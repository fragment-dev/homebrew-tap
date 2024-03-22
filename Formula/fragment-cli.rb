require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.22-darwin-x64.tar.gz"
    sha256 "bf2b1987ed907d65541bc19ba2d72184e7b69a4526efa6e4af170f865d905a33"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.22-darwin-arm64.tar.gz"
      sha256 "105dca228ebe979b23c3f859d3469458ea0320e8c89d5a7190baad7e6e884d1f"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.22-linux-x64.tar.gz"
    sha256 "8b32fe303e646395b647fc3bf1ee227c4f744f6df266e38693b271342a6e94ea"
  end
  version "2024.3.22"
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
