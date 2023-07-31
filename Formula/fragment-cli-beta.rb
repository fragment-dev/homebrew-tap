require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3199.0.0-darwin-x64.tar.gz"
    sha256 "278fa0b4c8257cd9d51ee93d7b6bbc9d0937a04070fc6e3ab2c685558f1ae68e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3199.0.0-darwin-arm64.tar.gz"
      sha256 "1441aafbea31bca8b53ee7b172372217154eae13d1416769c548763781d62cb5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3199.0.0-linux-x64.tar.gz"
    sha256 "4a1e14cc25a45aa70c8ac32b4226abed316bdf9b06c81db26a1eeca5fce1114f"
  end
  version "3199.0.0"
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
