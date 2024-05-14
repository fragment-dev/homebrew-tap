require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5055.0.0-darwin-x64.tar.gz"
    sha256 "ec47135edb6fa24e0aae06806d6d9acfb08d8e976417f554d5b6fe0bcf894289"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5055.0.0-darwin-arm64.tar.gz"
      sha256 "3eec27ee1caf5295d9d160a0c4b25b12b561ea4f8200f68517c5c0678c7efd13"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5055.0.0-linux-x64.tar.gz"
    sha256 "5d210f5c80b9c42f3221e8014460b7b3814b9d3ac3e7184ade424c8febf64a36"
  end
  version "5055.0.0"
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
