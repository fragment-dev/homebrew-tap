require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2406.0.0-darwin-x64.tar.gz"
    sha256 "76731a3d94301a6f13ab0004a2ce5c235016686bed21e849d81a4ebf7ce1306d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2406.0.0-darwin-arm64.tar.gz"
      sha256 "52c4767baf6f546f50ccf4c8013a3eef998ac84add5fed88d5e55806439b4018"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2406.0.0-linux-x64.tar.gz"
    sha256 "6eef507ee17644d7182f29f272dec4f2274a5d59ed2a958bde98c8833e00af6a"
  end
  version "2406.0.0"
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
