require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2931.0.0-darwin-x64.tar.gz"
    sha256 "12be51cb059ef28374010cbab6ceab01c66c5cd2bc6ef72f8343f1a25d7ab579"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2931.0.0-darwin-arm64.tar.gz"
      sha256 "c6714f5cc744c7b1b2ddb4d4d2789ccb337e4ae9b0ea8a0965202caa718abe2f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2931.0.0-linux-x64.tar.gz"
    sha256 "d05cb27df3f79613d44e0ad583278582c47eea3f9aa72f68de661063b64431dc"
  end
  version "2931.0.0"
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
