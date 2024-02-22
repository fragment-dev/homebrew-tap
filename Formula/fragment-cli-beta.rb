require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4619.0.0-darwin-x64.tar.gz"
    sha256 "c9716b383c604f1b5e0888ac96d39a4697fcff3ea5ef20902e584fda98543778"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4619.0.0-darwin-arm64.tar.gz"
      sha256 "9b3f33bb86dcc1ba23f5554ec05a24782e2a5a4151f94585af80387a466d2fab"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4619.0.0-linux-x64.tar.gz"
    sha256 "3f752b05a3d3bed7495740ed7365784fd1ecd4724a14baa54d353c9cba329a6c"
  end
  version "4619.0.0"
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
