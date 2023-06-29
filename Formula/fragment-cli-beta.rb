require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2982.0.0-darwin-x64.tar.gz"
    sha256 "56fab5500c99061ab095c04617f0656d29526f590fcad25df5860856a46e7372"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2982.0.0-darwin-arm64.tar.gz"
      sha256 "4f880442ed6ab424ebbd0a0b4353309148a5ae6b717db2aef74aba256097de3d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2982.0.0-linux-x64.tar.gz"
    sha256 "3e5a41fd34437c8ec7a485537a7debeb5f566f13fd2dbaea016532a47fce2318"
  end
  version "2982.0.0"
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
