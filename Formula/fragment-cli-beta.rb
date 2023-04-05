require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2365.0.0-darwin-x64.tar.gz"
    sha256 "099c01a34de32ec1ebc292427fbad3b9f089da1c8b118f2ab45d1034c17d1f87"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2365.0.0-darwin-arm64.tar.gz"
      sha256 "74ffbbfa1a70fe2f6f52464d8ebb28ebed46d10347acd7e4ea300bea169302f5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2365.0.0-linux-x64.tar.gz"
    sha256 "09274b088330d07e041f2aa3b046439499b20c9c9c9a64731f0aee1f27d2f47d"
  end
  version "2365.0.0"
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
