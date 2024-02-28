require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4651.0.0-darwin-x64.tar.gz"
    sha256 "eb4a6fa4d1bf4a4c943903ddba6011def8f56ffbdf288d66cc2117fb6760ef3c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4651.0.0-darwin-arm64.tar.gz"
      sha256 "11ab27c82ec1a28415a6855e66ee201931419572b2e78e2ddfa5a8da2395e76f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4651.0.0-linux-x64.tar.gz"
    sha256 "7515cca59b2588053290a2ecaa320430556e9ef1d485d79375132fb68c8d1c0c"
  end
  version "4651.0.0"
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
