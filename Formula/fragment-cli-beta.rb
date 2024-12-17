require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5910.0.0-darwin-x64.tar.gz"
    sha256 "02635586f0ebc11df9e3d411a45b4c5dc906bc2f8fae2e24f88c4c78a02c4e1d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5910.0.0-darwin-arm64.tar.gz"
      sha256 "e47a47e847bf600f1eb443eb50702eabe08e8dbe65008d07b8f3e81af0754e19"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5910.0.0-linux-x64.tar.gz"
    sha256 "d45f8b98fc22e0abc46c12505434d135588f403bfd29d09c6103d852b1f105a4"
  end
  version "5910.0.0"
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
