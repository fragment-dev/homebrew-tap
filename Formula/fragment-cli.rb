require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.13-1-darwin-x64.tar.gz"
    sha256 "dd95d0d9758722412b89cc8efdc5cb36fe3d1fa2ef178e5bac787802ef410226"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.13-1-darwin-arm64.tar.gz"
      sha256 "6f718ed60b2f3a43b38ed93d52f70e48bd996c1639467fd9b6d7ec8ee1e6ce4a"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.13-1-linux-x64.tar.gz"
    sha256 "e7e3b020313971a435ea54ce50f07b216b5f012335f61bd04b48bf8fe25d3d99"
  end
  version "2023.6.13-1"
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
