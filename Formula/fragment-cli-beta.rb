require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3055.0.0-darwin-x64.tar.gz"
    sha256 "558306c8288fcdac66367a2d84eea4e8b58109d12868fbdb70eaee64eeb727fe"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3055.0.0-darwin-arm64.tar.gz"
      sha256 "65a42dacdcef2f4f8dd0cc7838f8f70c3528f663503fe28214b827a4d52f99c4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3055.0.0-linux-x64.tar.gz"
    sha256 "f01f7d99296265f640251a9dc1632a4ca6e2f118094983e1a5b97df1eab65f5a"
  end
  version "3055.0.0"
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
