require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4429.0.0-darwin-x64.tar.gz"
    sha256 "6b14f7554444b3d0b22c8b3858fe9d2dc7ac3b28dfe06dc69801f9eb08fdc24e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4429.0.0-darwin-arm64.tar.gz"
      sha256 "6b6ef74420aaaca498755a1b8b0edb58fb989e485c36cfd361aad1525b6f5876"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4429.0.0-linux-x64.tar.gz"
    sha256 "c29c670fb6d53096cc15b276fd67e0d26cfac0c8c96b141e3830aecc47b61ac5"
  end
  version "4429.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
