require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3955.2.0-darwin-x64.tar.gz"
    sha256 "97c40d680353b3d66c4efdb285e85e720886dc1a24b7ad2b07abb980696780bf"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3955.2.0-darwin-arm64.tar.gz"
      sha256 "319a3ab66b837d98f82a28df37a3e7352679e6408c0896142e2e94bd921ac6b9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3955.2.0-linux-x64.tar.gz"
    sha256 "1aa62d4d3c4d524c7aa67a862af0420cbbac5cbeb4f9a3347b9a72bc4c9d5eeb"
  end
  version "3955.2.0"
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
