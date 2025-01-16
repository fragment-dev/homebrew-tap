require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6094.0.0-darwin-x64.tar.gz"
    sha256 "29c7d1f1f29f036a56f165f403587b0a10887b3a41737bbd633ae4d53b8bc598"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6094.0.0-darwin-arm64.tar.gz"
      sha256 "a9ebaef3eb5402845d495d0a2ab62fb969d3ed3526e4b2383af1a0044aa98da5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6094.0.0-linux-x64.tar.gz"
    sha256 "fbecbc297289403303abc200a1bdcf4e0e70145953423a2227ecee064809d466"
  end
  version "6094.0.0"
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
