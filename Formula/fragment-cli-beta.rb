require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3287.0.0-darwin-x64.tar.gz"
    sha256 "a2a724f3fa24a19ef70b18c7d0a5f4d15fa09cc40dd6550090b64411be81db67"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3287.0.0-darwin-arm64.tar.gz"
      sha256 "177868c7deccaec282771d17a6943e52cd4130822ed28530b25938d9ec1aa418"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3287.0.0-linux-x64.tar.gz"
    sha256 "46cfed396203d2e95883764aa601eeac9435595e8dfbb5061997edc3a7d3253b"
  end
  version "3287.0.0"
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
