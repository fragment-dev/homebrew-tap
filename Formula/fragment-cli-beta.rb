require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2991.0.0-darwin-x64.tar.gz"
    sha256 "64b08f0f4d8ac61269c55fbfc0ec8147154951cdf11f0d25790b67af4a46f37d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2991.0.0-darwin-arm64.tar.gz"
      sha256 "83a04c939910d1385339c4cf2610be82259967d667afe739ab9a580581001d91"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2991.0.0-linux-x64.tar.gz"
    sha256 "958dd859ea6b8bd79af643ab1c7878853801f0eaf83cd18ce38b13987322406f"
  end
  version "2991.0.0"
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
