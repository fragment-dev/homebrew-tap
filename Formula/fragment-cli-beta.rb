require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3473.0.0-darwin-x64.tar.gz"
    sha256 "07eb400334e08477a3d91cf2baec15e3feef2ab28654da052ea407be305ed769"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3473.0.0-darwin-arm64.tar.gz"
      sha256 "73602e3d8ca99d6a702dec5e16f2453bafde8f048ab0b0b4b332c7123bc9fe68"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3473.0.0-linux-x64.tar.gz"
    sha256 "dd61bbe1d819a6b39ee6abfb2a2fed8a64cf59897006285176e0e102a51405c3"
  end
  version "3473.0.0"
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
