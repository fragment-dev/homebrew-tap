require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2721.0.0-darwin-x64.tar.gz"
    sha256 "abeb44185f06cb8f315b3ad36473911f47c6d1c701d80b9a9dfd0478c8876f1f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2721.0.0-darwin-arm64.tar.gz"
      sha256 "ca8326509f39c1db773520d7b1c5f0796e3768138717fc656653eff71483c71f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2721.0.0-linux-x64.tar.gz"
    sha256 "f0b982cb85ac75849a043d9e22d98c5eeb95831811e3cdb0b84999cc90903e77"
  end
  version "2721.0.0"
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
