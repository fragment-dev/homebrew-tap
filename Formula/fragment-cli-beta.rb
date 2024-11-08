require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5751.0.0-darwin-x64.tar.gz"
    sha256 "ff65b321e2aaa18a35e8480cf4baa178cdcdd6a3d4f40f3f007f5872598cc90f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5751.0.0-darwin-arm64.tar.gz"
      sha256 "366f4c3771e2c48beb32a4e6812df8a212415853b41cdefbb0af2121a8f62ac8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5751.0.0-linux-x64.tar.gz"
    sha256 "0f5237d5dc09ab9cdb36e221786e1bd5468904d754ff7b5f5de238e0e2f1c685"
  end
  version "5751.0.0"
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
