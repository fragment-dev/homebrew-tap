require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4602.0.0-darwin-x64.tar.gz"
    sha256 "86ad219d7f428bf38ccbf8a18b4f3d745d6111617cb7abb98214ea54cb95ca41"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4602.0.0-darwin-arm64.tar.gz"
      sha256 "bfb891612679bea01104b76dcf4b62b9f9d183c739ef2ac621b72a533e1bdb58"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4602.0.0-linux-x64.tar.gz"
    sha256 "5a245e66d8fef6cd85baad20571370f77abb9b0ce4730c28405c13833e8b7379"
  end
  version "4602.0.0"
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
