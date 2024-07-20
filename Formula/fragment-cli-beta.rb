require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5415.0.0-darwin-x64.tar.gz"
    sha256 "d141b7c1dd5f2cae342d43578eec864b7d839509a7b9c022fb64b66972d0e8af"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5415.0.0-darwin-arm64.tar.gz"
      sha256 "e104edc23811f629a68e02b3aa26b151baf278f28792af1ae8dbf27508eda707"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5415.0.0-linux-x64.tar.gz"
    sha256 "209f19d2673d7b99da281a6ce6dc5d0dccabf7d5a767f2766c72ee770848cfe3"
  end
  version "5415.0.0"
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
