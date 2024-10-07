require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5651.0.0-darwin-x64.tar.gz"
    sha256 "c69733bf90998ab6cfc571a32c211c9df5b30d682514160a437ec6977a378260"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5651.0.0-darwin-arm64.tar.gz"
      sha256 "e5d82347c3eaa9b05484497dbb0a6181e71c57394626e704d6f8d9ff2bd63674"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5651.0.0-linux-x64.tar.gz"
    sha256 "6ece6323794f9004a885bd092e2970a747717e9cea25fb6ce5271c3b3119bdc7"
  end
  version "5651.0.0"
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
