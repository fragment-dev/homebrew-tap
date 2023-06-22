require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2907.0.0-darwin-x64.tar.gz"
    sha256 "4898ddd734d9adfddfa24e93d417e0ef4ca5c9d29452092ae2fd54468fb4fb94"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2907.0.0-darwin-arm64.tar.gz"
      sha256 "41914ac4b39b3bff55cae85b5d69034d8870732eef1bce43525b43972f514666"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2907.0.0-linux-x64.tar.gz"
    sha256 "e9839d060fe9d5a65aa2350353d8587c5c6ff452fde44f3f0fc626a73e87eb99"
  end
  version "2907.0.0"
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
