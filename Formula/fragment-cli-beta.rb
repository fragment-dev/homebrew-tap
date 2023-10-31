require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3941.0.0-darwin-x64.tar.gz"
    sha256 "076a34971c739f8c297bea11a07269906d2924c57339895affcbe35096445c64"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3941.0.0-darwin-arm64.tar.gz"
      sha256 "1556a05f6282a9ed7a5d5677a6883605598f75eb4333a33431bd6cc24550ced0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3941.0.0-linux-x64.tar.gz"
    sha256 "e48598715db51edb6a806090119ad6abe5e9977f438fe6a69ff4b246721cda57"
  end
  version "3941.0.0"
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
