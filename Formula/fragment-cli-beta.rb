require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3848.0.0-darwin-x64.tar.gz"
    sha256 "cdaf44c716ad2f02c92aa0feee116590d531b47f265807de453f141020c0cbe6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3848.0.0-darwin-arm64.tar.gz"
      sha256 "0ac2e863978f4defb490bb6fbba8d651cd7968e01595ec16f1b62eab4b9f0af4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3848.0.0-linux-x64.tar.gz"
    sha256 "402da4f8b8994ca15dd8ac6c000280c39f2c2818eb0eeee7464104c9b5ff1a9b"
  end
  version "3848.0.0"
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
