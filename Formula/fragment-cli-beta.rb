require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3529.0.0-darwin-x64.tar.gz"
    sha256 "05fb897df2b4b6e8802dc5649b00c2c5b0e2efc76aee514b1ee1f3bf3eb1e61b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3529.0.0-darwin-arm64.tar.gz"
      sha256 "ddf570e709b301e9920b80b67634458fb300ad8d2e000df0375aa4946f31e689"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3529.0.0-linux-x64.tar.gz"
    sha256 "69cb961f586a02abc4485a3efcf9e48ae01150c1d2c57fa95c7d84afbb05b3d0"
  end
  version "3529.0.0"
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
