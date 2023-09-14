require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3552.0.0-darwin-x64.tar.gz"
    sha256 "1ae1ef4c52e8b49cefa313fa00afc15b77a2888a716c94d9b2474ceef069f6f5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3552.0.0-darwin-arm64.tar.gz"
      sha256 "edb42f82e9740467b683bda0b6a21fd0e520a0ee37db3a27de33e84e902218b7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3552.0.0-linux-x64.tar.gz"
    sha256 "47b22c8a0d2ae2bc78403b6cb9f9c1f0c569773c7924805f02c268fc1e85d843"
  end
  version "3552.0.0"
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
