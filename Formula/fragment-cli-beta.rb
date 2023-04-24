require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2509.0.0-darwin-x64.tar.gz"
    sha256 "ee4abc4e74de0652d97263eccb4b566268ba11b77ca4633736021ccd8173e6a4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2509.0.0-darwin-arm64.tar.gz"
      sha256 "8c85346a3146b67bd98684928405ed4d787e85fae6e166099af014607bd627fc"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2509.0.0-linux-x64.tar.gz"
    sha256 "1a1fe089149dd0f52b5e2a3d8228ad618e3839548f0e4a9568f3e8b35d57e3ea"
  end
  version "2509.0.0"
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
