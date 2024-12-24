require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5981.0.0-darwin-x64.tar.gz"
    sha256 "695df7430d9c9d1640cb19947d4614d6ceefc32a2be24e09d582e0e4e34115f9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5981.0.0-darwin-arm64.tar.gz"
      sha256 "bdee6723d0a3e65e6965598435afbab5a9c20603da00bc251836f5b0049e866c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5981.0.0-linux-x64.tar.gz"
    sha256 "880c78804b00244ddbb76bae892330742e53d2bc2971605a0229bfec33b5d3a5"
  end
  version "5981.0.0"
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
