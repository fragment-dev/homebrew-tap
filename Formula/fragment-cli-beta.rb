require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2547.0.0-darwin-x64.tar.gz"
    sha256 "8aa8a7364477b4fc97163eb0f515afaacb8f8f22e6052acd0b6c48301ef046a5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2547.0.0-darwin-arm64.tar.gz"
      sha256 "02a1987b286d0ddf14948d01070dfa8d79395740f55fe14814ea4a745cc23803"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2547.0.0-linux-x64.tar.gz"
    sha256 "72e4eb1c085fb8318d374b288a2f24503eb6bcafa5433344e48ee7f3e7d47d4d"
  end
  version "2547.0.0"
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
