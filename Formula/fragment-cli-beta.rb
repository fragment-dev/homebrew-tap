require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4783.0.0-darwin-x64.tar.gz"
    sha256 "96cf7381611fb70bb7a2a30615e652f901528bbe256f7318321fa28db1d88ae4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4783.0.0-darwin-arm64.tar.gz"
      sha256 "e697ffc083df4774ea750a75e5c8518b0ed4ee6c236c926f7df5961245565a91"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4783.0.0-linux-x64.tar.gz"
    sha256 "4e44f059b520abbfd1d2224ebe97b3b2cf2d3675b5af2de86a5558200a8159e1"
  end
  version "4783.0.0"
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
