require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3326.0.0-darwin-x64.tar.gz"
    sha256 "f6d3cf3b2d2acb9eb2fea303bce2338c0368ba8db2d37e6ca5a29ff43f6f7610"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3326.0.0-darwin-arm64.tar.gz"
      sha256 "f745b59621ab721641fbc85a9d194ac4f98bf2cc667a73a7057cc7483d8bd96e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3326.0.0-linux-x64.tar.gz"
    sha256 "339d0aa9118629a5f8b2df9a273931407edba68ae89a4119d16efa874c0c741d"
  end
  version "3326.0.0"
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
