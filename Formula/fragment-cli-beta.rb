require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5831.0.0-darwin-x64.tar.gz"
    sha256 "c26cc5b76623ac3e270100ceebfcac40719e13e603bf7bcb2ec3ea6994a4e372"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5831.0.0-darwin-arm64.tar.gz"
      sha256 "5d4c6f2fb83481d9d4e938ce2a47b678f11b8a94ea38c0578a43a5dfeea88db2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5831.0.0-linux-x64.tar.gz"
    sha256 "b4c331d430f916117137d8ec268607d2f00f80a1e9c9ccb649f513ca25df8f35"
  end
  version "5831.0.0"
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
