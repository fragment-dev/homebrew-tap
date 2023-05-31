require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2771.0.0-darwin-x64.tar.gz"
    sha256 "765b6bc6b5b338d2f4c677d2be9ee9b65df44333849ef1227ce2501073d664a9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2771.0.0-darwin-arm64.tar.gz"
      sha256 "7df274dcc9cb715aa224abffccdffe8029f73afcb758b219b12e1e39b0d03426"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2771.0.0-linux-x64.tar.gz"
    sha256 "7116ea8d35c2c6533f6a1de75058ba317dffa0d4f5a56613dc580873ae9d7d49"
  end
  version "2771.0.0"
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
