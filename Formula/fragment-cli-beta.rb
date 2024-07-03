require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5344.0.0-darwin-x64.tar.gz"
    sha256 "ec46c401343c1b0a7428ab6393a9c8c9876faba4bc1994042204944abe504128"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5344.0.0-darwin-arm64.tar.gz"
      sha256 "920f919e5936154a31ff76dc00debe76974014eb972c9cbecf7af4316d8b4543"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5344.0.0-linux-x64.tar.gz"
    sha256 "64ec248edce0c0b0014c8bad02730e7dae7ad29bf995e4992e115bd95a933204"
  end
  version "5344.0.0"
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
