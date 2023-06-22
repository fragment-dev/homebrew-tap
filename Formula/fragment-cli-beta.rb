require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2903.0.0-darwin-x64.tar.gz"
    sha256 "8f6ca8dac793381bd0c9951e77dad7b3646266054bae76f59533123a6ce39b7c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2903.0.0-darwin-arm64.tar.gz"
      sha256 "f8a03b926492d70b143d2adf8254db3e2a4e038e223712cb7c02e3320c25005f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2903.0.0-linux-x64.tar.gz"
    sha256 "2b4d10904f0895aa5abb7297db23a1cef77e20c0b7feab2595a56e3b5bccc5a2"
  end
  version "2903.0.0"
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
