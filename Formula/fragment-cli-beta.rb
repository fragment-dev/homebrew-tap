require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3019.0.0-darwin-x64.tar.gz"
    sha256 "492bc4a5725017ea635efd08f23de1b0aa2f8731cc3e9c77cd0d16f54dcbdead"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3019.0.0-darwin-arm64.tar.gz"
      sha256 "f7201194c26d533942e629877cbf8d31f410c8f0c2abf94aa29845fe8f0682df"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3019.0.0-linux-x64.tar.gz"
    sha256 "2e6722618cd2661e32f3b3604d2e9d752df886fb7c473e487d502dd84578b435"
  end
  version "3019.0.0"
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
