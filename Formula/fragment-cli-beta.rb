require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5722.0.0-darwin-x64.tar.gz"
    sha256 "9d71cc93f413cf0c28006f1805a8ec4fa37ea4e5c1069a432870ee7dea64af66"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5722.0.0-darwin-arm64.tar.gz"
      sha256 "8a77f7fc89e648420b85dbd80e1df7db4dc0f07422dcb7ccdd21e899707739ae"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5722.0.0-linux-x64.tar.gz"
    sha256 "6143566f4389bee0d5fdbebeaf77347a31a3edcfb94365c87f76e1d1d4594dc1"
  end
  version "5722.0.0"
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
