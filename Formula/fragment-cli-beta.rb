require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2961.0.0-darwin-x64.tar.gz"
    sha256 "fc73dc3c1d0ae84ae114962dd253dc513a20cdf528af287ea7ff768877b4e0ae"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2961.0.0-darwin-arm64.tar.gz"
      sha256 "669d4c876946ddbfb66b45501d676db7601d965d05844fd15c8364e7909449c0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2961.0.0-linux-x64.tar.gz"
    sha256 "a6933abc55c6b2b508d25f3c95c0a258d64f7c1b6072f8941397e9bcef66a8a6"
  end
  version "2961.0.0"
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
