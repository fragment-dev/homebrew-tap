require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4557.0.0-darwin-x64.tar.gz"
    sha256 "7080e760a5264ade32f6cb2e67f514d9832aaa61dc284db879fad760965cc613"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4557.0.0-darwin-arm64.tar.gz"
      sha256 "1d300fe4d9b9600221873dfa730fbe418f89b6739f17872c4e7e7526897adb12"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4557.0.0-linux-x64.tar.gz"
    sha256 "974f8e357b16332714813d0d2825b57c824a4601c72057227f5327d47a02f723"
  end
  version "4557.0.0"
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
