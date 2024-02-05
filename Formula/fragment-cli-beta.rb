require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4494.0.0-darwin-x64.tar.gz"
    sha256 "d6ca2002111bba85eae2bc385b819eb6372511ce29ccf8a0d24a9e468eb69f6b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4494.0.0-darwin-arm64.tar.gz"
      sha256 "25d23529ce73e9ffd08eae5a652f553b64ab70fdb1773f512bc630abbc5f848a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4494.0.0-linux-x64.tar.gz"
    sha256 "fe79d79d1ae49fcc7f217cf0cf56260f2d755bd6a29a1f11f200fc016f689d9e"
  end
  version "4494.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
