require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2954.0.0-darwin-x64.tar.gz"
    sha256 "43e1b08ffc0c1ea1abfca3e759aaa065ffa71b98aff78d303e9ad50f7838e99f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2954.0.0-darwin-arm64.tar.gz"
      sha256 "781629ada0e3b72363bc2dfc1ecdb777b439c6c3ed318cc9f806fbe8764d15e8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2954.0.0-linux-x64.tar.gz"
    sha256 "9385eb3b8a36a85ef2a3c7c716c1f68c6105d15d0f8392e516cfd3f36fa9de91"
  end
  version "2954.0.0"
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
