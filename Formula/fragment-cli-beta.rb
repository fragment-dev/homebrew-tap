require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5973.0.0-darwin-x64.tar.gz"
    sha256 "aec4330ee440c1232b11e98adf3704d412339ae496e0fb7156af09cfa80a1210"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5973.0.0-darwin-arm64.tar.gz"
      sha256 "27dc95e540d9fbd7c27c46b7ba67625ffca192c2d2328d7b3394142e7401e0de"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5973.0.0-linux-x64.tar.gz"
    sha256 "8361803f53a91e72202bd8be84bc68e9169071a58159ed81b0c6fc6554ef59d7"
  end
  version "5973.0.0"
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
