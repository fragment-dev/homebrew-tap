require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4860.0.0-darwin-x64.tar.gz"
    sha256 "6e7a5d398e886ab1b2a23b318168effe20d9d7879d899556a5696d7fa26f6f7e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4860.0.0-darwin-arm64.tar.gz"
      sha256 "a6b9c0cd87d26675c3460945c805b4c221592b1a230cab019196146f43d74447"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4860.0.0-linux-x64.tar.gz"
    sha256 "c33b000eb8e4e96cd008ad95911b41f419502c000e2db03876f5ece46d06baae"
  end
  version "4860.0.0"
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
