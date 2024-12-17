require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5914.0.0-darwin-x64.tar.gz"
    sha256 "bea7306457f20915e22b9b47865ffbd602fccd9ce072c28600061b300c15d4f8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5914.0.0-darwin-arm64.tar.gz"
      sha256 "e86faacdb2c46c810cdccebab4a971ea538def2554aa32f480095425658d0858"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5914.0.0-linux-x64.tar.gz"
    sha256 "4464c3343daee172b6be9d7d17c297e8d89aeaa16cb84e890a192eaac9824a20"
  end
  version "5914.0.0"
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
