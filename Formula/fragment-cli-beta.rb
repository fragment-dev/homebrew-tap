require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4790.0.0-darwin-x64.tar.gz"
    sha256 "a266b82163a35f03c1b20c8d5612aa6c8f2c1476f7df156ddf5e7b1a197df060"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4790.0.0-darwin-arm64.tar.gz"
      sha256 "cf77ca3dd8c46b55023210e3e5019fb5a658babc8e146ba34291f9535f916f37"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4790.0.0-linux-x64.tar.gz"
    sha256 "07ca2864f5ff350faff9dcda484222a221e3631db0f42f74a9b742fe07323b19"
  end
  version "4790.0.0"
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
