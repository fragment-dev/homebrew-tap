require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2352.0.0-darwin-x64.tar.gz"
    sha256 "2e582d37e5d3dd70a32bf0f2da2484f700a2a3b4b1036161020cface470347ef"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2352.0.0-darwin-arm64.tar.gz"
      sha256 "7d7aa699432f49aaf47b7a6961b9e4be62f6c10213363a863e85775e714ba236"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2352.0.0-linux-x64.tar.gz"
    sha256 "0b7220cd4358f39c0f1a27662e8f6c32a5c30c6a7a5c6ce04072fe029dd8d001"
  end
  version "2352.0.0"
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
