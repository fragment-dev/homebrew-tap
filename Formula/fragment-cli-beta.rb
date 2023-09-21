require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3641.0.0-darwin-x64.tar.gz"
    sha256 "b3c2ffdc7d5112f2c1ac495cc399976af7683360ce6fa83d139f550d04aad0a2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3641.0.0-darwin-arm64.tar.gz"
      sha256 "61bb287acd65583b50eab3cfbcd58e5a9bea313614c110bea75486f1c2cd1257"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3641.0.0-linux-x64.tar.gz"
    sha256 "966eb9e27c99721301f9563db0e1eba868817a07d8dd59fc0c6e9b59d58ed527"
  end
  version "3641.0.0"
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
