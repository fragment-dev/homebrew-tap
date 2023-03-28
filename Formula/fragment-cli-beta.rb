require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2294.0.0-darwin-x64.tar.gz"
    sha256 "4dc9a9b6c74b5d655f3e03a15615c7bdce38ccef40e8b3dddb13141d4dcb8e3e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2294.0.0-darwin-arm64.tar.gz"
      sha256 "5ac8d63a001e4f80e3f4fafff873d4ae26bd511ae262af0742e58d8dbfd60653"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2294.0.0-linux-x64.tar.gz"
    sha256 "dfdabeb1478ecfb02eb2dcde00c11beb07c94260ea89987aa94ff20d0a25cd38"
  end
  version "2294.0.0"
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
