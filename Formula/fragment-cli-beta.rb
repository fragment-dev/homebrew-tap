require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2556.0.0-darwin-x64.tar.gz"
    sha256 "6fe729d4e313e0766180421ee1395799bad160d60137b3eba35b8ac10ae536fa"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2556.0.0-darwin-arm64.tar.gz"
      sha256 "faf729b0bd4809483b6492c69a5f256313369a02bb1a909a7e82b2d22cda6306"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2556.0.0-linux-x64.tar.gz"
    sha256 "3b314e5001d1f2067667e05d726520b7a0869aaccad1c4c23c21c9983656ca2c"
  end
  version "2556.0.0"
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
