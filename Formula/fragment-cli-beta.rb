require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6021.0.0-darwin-x64.tar.gz"
    sha256 "605576805c3c737b4988187e7109508964cb7ab4f66e9eb25907facc5f3105a5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6021.0.0-darwin-arm64.tar.gz"
      sha256 "48c09dded00e79fad5ca339aa8cafd688067bff926ec19c7cdb4f335b51ac3e1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6021.0.0-linux-x64.tar.gz"
    sha256 "716896e8b382697f186612b037aadd543dc6e4470fe83c00c34d1f7233ce5a91"
  end
  version "6021.0.0"
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
