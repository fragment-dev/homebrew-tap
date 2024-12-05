require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5848.0.0-darwin-x64.tar.gz"
    sha256 "bfcc6bcc25a440ddc6b98acbd796213271ed149a06260d0bc4500b77d834b02a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5848.0.0-darwin-arm64.tar.gz"
      sha256 "9b96afeda42255b4470092f5e39fd524d2744078cb655fbaa6da21276220c8af"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5848.0.0-linux-x64.tar.gz"
    sha256 "af1ed742ff86ea46df192353372cabd8cf76c852f03a82628837d1f54d0c5cc3"
  end
  version "5848.0.0"
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
