require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3830.0.0-darwin-x64.tar.gz"
    sha256 "ae501842fb6f12374aca9af5fb19f333a18e575580fe36db3b8d43f520adf974"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3830.0.0-darwin-arm64.tar.gz"
      sha256 "3087e11932fa7cd6dc98e419f07722389e6bde99dcd335921a8496e21ee81b47"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3830.0.0-linux-x64.tar.gz"
    sha256 "15c2905891e0b52d227b966d9a86b6f1f1e6edea586dbc703ccc9645fde02b92"
  end
  version "3830.0.0"
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
