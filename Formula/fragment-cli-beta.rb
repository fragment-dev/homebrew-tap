require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5820.0.0-darwin-x64.tar.gz"
    sha256 "9d6bc0caa7cfc3fce7c257c2ed144a8785377d47b20df66388bd4e1d4a4eb3f6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5820.0.0-darwin-arm64.tar.gz"
      sha256 "71725bc364fc30d519e8479202e1338c2a1d7ac3061dd97f22e4addb17090b6a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5820.0.0-linux-x64.tar.gz"
    sha256 "524d70fb8796c057a6a40b6981a49714942cfde8bbac84ee9204f1f1dfe8985a"
  end
  version "5820.0.0"
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
