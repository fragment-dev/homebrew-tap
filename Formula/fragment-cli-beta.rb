require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3145.0.0-darwin-x64.tar.gz"
    sha256 "90d87a6d203d3a7c19091148aa0309977a45c52f15997a4556288e22d8113351"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3145.0.0-darwin-arm64.tar.gz"
      sha256 "b140eea872a522bcfc78ec88ad2f05f741c287f9d270560e747bd1617b474e43"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3145.0.0-linux-x64.tar.gz"
    sha256 "0ab8c6035a373d4d12eb620ebf6f3ecea3ad0e741619b11cb238f1dbf317eccd"
  end
  version "3145.0.0"
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
