require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3454.0.0-darwin-x64.tar.gz"
    sha256 "ba7cb5d25d2f586aa2982dbfec4a6263b37fde516564292b8fc59fd376980302"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3454.0.0-darwin-arm64.tar.gz"
      sha256 "6ce36ebc5d89530ecc4bb2bbc2ddecd67211d0b57284475554fb72c1ea5e5c2b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3454.0.0-linux-x64.tar.gz"
    sha256 "ca68cd98bc00d3e5428c15b9c12ad95684635dd151b81169f3dcf20d7c828e29"
  end
  version "3454.0.0"
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
