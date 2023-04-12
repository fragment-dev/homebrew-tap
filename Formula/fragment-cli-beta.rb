require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2417.0.0-darwin-x64.tar.gz"
    sha256 "6a1d31ab8a4b3962d356f9b1c48c2db67edb82302937ab8f3ad6876478a66760"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2417.0.0-darwin-arm64.tar.gz"
      sha256 "2f2de66779ac47f997c37e225e3e15e80857caec9d9cdce848e15e53a1106276"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2417.0.0-linux-x64.tar.gz"
    sha256 "714444f201319c6b0610a5cb9f1f352e5a62613c180b51a490696b336061300e"
  end
  version "2417.0.0"
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
