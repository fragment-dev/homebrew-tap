require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6135.0.0-darwin-x64.tar.gz"
    sha256 "69a4949cd1bb88e47020b32d3cfc3c71489cd437eb5a79a0238f7b6d3d784e1f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6135.0.0-darwin-arm64.tar.gz"
      sha256 "48aa0579dac67186d45942a49a13acffeae36e7c91a0a29de550794a94f777b8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6135.0.0-linux-x64.tar.gz"
    sha256 "2ed348f8a8ca51fd605abbc65e9601ed1a7af4b86b677bb98bbb5fe8bb418b7d"
  end
  version "6135.0.0"
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
