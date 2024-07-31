require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5457.0.0-darwin-x64.tar.gz"
    sha256 "2cae3af39929787074f13b28eb510c7c8cbd79a2cf91098cc8b394844ba45eeb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5457.0.0-darwin-arm64.tar.gz"
      sha256 "2400fd1194431c2a9603975cf30223dc4b363c9a45aa25fd29f9ad98adfa81c5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5457.0.0-linux-x64.tar.gz"
    sha256 "6646a1a7936182b4f59a1a81ca958788b54afa79e30c9bc859cb3b2d51113203"
  end
  version "5457.0.0"
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
