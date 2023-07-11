require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3032.0.0-darwin-x64.tar.gz"
    sha256 "da64627d662e8549f4eecd572a7f120f41ad256969e7bc5ecf4f1a49aac360c3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3032.0.0-darwin-arm64.tar.gz"
      sha256 "23ed150e874898c8f2a75c892ed0ae605a159714a93ce7fbd771beb90a6566fc"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3032.0.0-linux-x64.tar.gz"
    sha256 "9623baa7f7ad6241bfead9fa596c449d014882489684a50581529e2f867eab30"
  end
  version "3032.0.0"
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
