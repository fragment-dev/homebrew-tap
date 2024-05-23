require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5117.0.0-darwin-x64.tar.gz"
    sha256 "65dfc5172f69e530197f41b87af11696f15be4127e5e5cd6cab5aa117d45f9e6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5117.0.0-darwin-arm64.tar.gz"
      sha256 "6a9e1b8ec3e24cf350d7fad4984da308e1e1db6bf665e2d31b938406b3045377"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5117.0.0-linux-x64.tar.gz"
    sha256 "e10d30c124b55fb95fd61b7b1c1ea0a4c485002651b4b6229d1edcccd1d76856"
  end
  version "5117.0.0"
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
