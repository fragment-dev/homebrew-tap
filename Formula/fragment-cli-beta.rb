require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3545.0.0-darwin-x64.tar.gz"
    sha256 "d65f237321ca9afb92a71f91b80baccda2960f6106e863c59309a5d3e84d7344"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3545.0.0-darwin-arm64.tar.gz"
      sha256 "add2faffa4a70dfb39baac94dc1d1e2d8856de946eec8b81a0baa177c6ddb546"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3545.0.0-linux-x64.tar.gz"
    sha256 "9002fe55809a1523a20a6187462fd39e59f0b995c689791472756f770789a618"
  end
  version "3545.0.0"
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
