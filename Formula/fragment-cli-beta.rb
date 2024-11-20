require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5809.0.0-darwin-x64.tar.gz"
    sha256 "0451e85b6e3aaed898212afd08b2c82d5898a9bcae25411bddf92b5c44893241"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5809.0.0-darwin-arm64.tar.gz"
      sha256 "574e1dabf95468b720c917511b73b4f4ca1243a2615639bd4613979a9c15fa42"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5809.0.0-linux-x64.tar.gz"
    sha256 "7da3a80e1830d210f7fff5c520843cefd379f6f2d5e4a422300a97f2aa777c59"
  end
  version "5809.0.0"
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
