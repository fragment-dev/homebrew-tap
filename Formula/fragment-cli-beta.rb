require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2399.0.0-darwin-x64.tar.gz"
    sha256 "3ab8f8409e20264eae80b131426f97e13888fc87553c253aab89fc6e96b2ec1c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2399.0.0-darwin-arm64.tar.gz"
      sha256 "cf5f854e8c0eb25744b177a07732f69187c0da81c50d41939b8a6b5a69a408aa"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2399.0.0-linux-x64.tar.gz"
    sha256 "813a7112e745830338043ba70e71c87b5ea67f671602f93adefb8b70c53688b8"
  end
  version "2399.0.0"
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
