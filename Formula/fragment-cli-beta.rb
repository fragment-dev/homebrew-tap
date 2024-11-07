require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5743.0.0-darwin-x64.tar.gz"
    sha256 "96790eb5f3863c7fe28a62042b21ab539698bd0002a69850dbacce2adbe5e638"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5743.0.0-darwin-arm64.tar.gz"
      sha256 "1147274159ff0134fb6412c81538d14015955fb9ac1e80cfbcc7cb33c5397bf4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5743.0.0-linux-x64.tar.gz"
    sha256 "ba8c7c498c92b66199e4335c01a82a8ea4caaa49f19644ae09a6601ec3e3c0a7"
  end
  version "5743.0.0"
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
