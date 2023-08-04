require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3233.0.0-darwin-x64.tar.gz"
    sha256 "489151c81ee088eca32bb82e073f5c223874fc1e93e5ca87b2168888d1c13bea"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3233.0.0-darwin-arm64.tar.gz"
      sha256 "41d0bea9191fe03561bcb6fc7a189f2782eadd127755f9238031305b5b529c89"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3233.0.0-linux-x64.tar.gz"
    sha256 "efcfa5181b96d41806aa056d2bcb65e3abb040ad38969dbb3f411273ce3c0832"
  end
  version "3233.0.0"
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
