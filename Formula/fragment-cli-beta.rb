require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4608.0.0-darwin-x64.tar.gz"
    sha256 "7f5e1c356dfd1796745eb260784d28d4c4327295fe37caee308ba06ec34f3683"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4608.0.0-darwin-arm64.tar.gz"
      sha256 "c70305c67e27c34983410a7f81f1766c01f928d9b3b4ac2208ca0532efb3b906"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4608.0.0-linux-x64.tar.gz"
    sha256 "a8a47c2203154164d7615823b83aafe7d78c5b5fd7f715b0e6a1944e78465df9"
  end
  version "4608.0.0"
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
