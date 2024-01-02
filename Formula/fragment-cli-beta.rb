require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4244.0.0-darwin-x64.tar.gz"
    sha256 "a64203b96db52a2142df6e44657d0161e8e7644e305db3e9e3b6bb583a521bab"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4244.0.0-darwin-arm64.tar.gz"
      sha256 "1c53d0e1fd2a0c7abf96ae42d8d053147bfe93acd94a810850ed0ed25ccca820"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4244.0.0-linux-x64.tar.gz"
    sha256 "7170be2833a6e16358a74dcbf58900f1d25b4396d3716a4231df9e849d47ac1c"
  end
  version "4244.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
