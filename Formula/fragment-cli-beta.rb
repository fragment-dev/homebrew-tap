require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3361.0.0-darwin-x64.tar.gz"
    sha256 "71954bfe42a69d67d222fabd9247369825dfe697e1a5cad665f3e58b00152826"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3361.0.0-darwin-arm64.tar.gz"
      sha256 "4714b8ff4aaff8bced90fef8e5fbb5346e7a08b93d74fc0799c871be50f68368"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3361.0.0-linux-x64.tar.gz"
    sha256 "05433255d1190ad77c4d4a752ef9663c05273fba124d35f1ff6b6cccfcaa78cd"
  end
  version "3361.0.0"
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
