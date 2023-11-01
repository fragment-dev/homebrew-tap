require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3957.0.0-darwin-x64.tar.gz"
    sha256 "3d95b496357e6fce646a53b8ece43a34a8505575c3350d99e6cf1fa4ff5fcc5f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3957.0.0-darwin-arm64.tar.gz"
      sha256 "bc5a5842e0ff59975f182fdf8ed828a472d730b51f944a14c6e84302d234c633"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3957.0.0-linux-x64.tar.gz"
    sha256 "704aeaeda5401c7645367d9fc26c168fabaa74a316185581055eb764cb56b774"
  end
  version "3957.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
