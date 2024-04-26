require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4951.0.0-darwin-x64.tar.gz"
    sha256 "59b2e3af8aba9be93aeee72160f32fbcaf09ee94c770b3602545a0834208fcf3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4951.0.0-darwin-arm64.tar.gz"
      sha256 "c5311142916841bc959c66497b5866b2080ee100fdcf62b13e5f200b45cbf4b8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4951.0.0-linux-x64.tar.gz"
    sha256 "54e00eb3db1819d3f6d7c95c5bc23c10e6f74445478bdda39b7f04001fdaf5de"
  end
  version "4951.0.0"
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
