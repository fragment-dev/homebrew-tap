require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5748.0.0-darwin-x64.tar.gz"
    sha256 "96f0f5ea92ac45f328731d1f1ca8c32e232375ba8299351cee06fbcdc95804e9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5748.0.0-darwin-arm64.tar.gz"
      sha256 "27221ae1a0db65a6be110cf750adae4718ec6a846eba07634a5fa127e1561f84"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5748.0.0-linux-x64.tar.gz"
    sha256 "248ac3fdc42902bda7f12ead9ce7360ec1c2b8f212f052ea17ea41d0febd9c14"
  end
  version "5748.0.0"
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
