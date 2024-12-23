require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5965.0.0-darwin-x64.tar.gz"
    sha256 "ddbbf01e324cec554fc664e8762688ddcd3c3b362b0b79e7067b6b5ce0a534a5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5965.0.0-darwin-arm64.tar.gz"
      sha256 "45e6d086103d239bd2d60957eaf776b801f2278aadd68c82940c417cfb01f388"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5965.0.0-linux-x64.tar.gz"
    sha256 "805518bff4d6529b95706e591d28924863c030920ca847f545447def77a2fe12"
  end
  version "5965.0.0"
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
