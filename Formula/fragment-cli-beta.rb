require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4597.0.0-darwin-x64.tar.gz"
    sha256 "cf938fca4d1cc4ffbfb133e373fbdc3cd74c5293668b33b2f97f66f7caa894ce"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4597.0.0-darwin-arm64.tar.gz"
      sha256 "a5c144946a3ba6d3ec8d6c4deede2cba0354ae05f293d22dfc2cf320389053a6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4597.0.0-linux-x64.tar.gz"
    sha256 "65a5a71e307daaf56af7acba3714bf4527d179fc667125eff26064bf4ae0e4be"
  end
  version "4597.0.0"
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
