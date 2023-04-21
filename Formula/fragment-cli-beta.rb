require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2502.0.0-darwin-x64.tar.gz"
    sha256 "8d5bb8e5bcb21fc8b7b73c0ba6a85b9909d8a363740dc6dee9252760f96a2e46"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2502.0.0-darwin-arm64.tar.gz"
      sha256 "fc22ffc1ffe19cf7cbc42259275db0fa80e8f6bdae23870ed0a88b110105f422"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2502.0.0-linux-x64.tar.gz"
    sha256 "d16f47846f58e4ae05661faee244ccb5c7ade73b874f859f709241c0496f36fc"
  end
  version "2502.0.0"
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
