require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4707.0.0-darwin-x64.tar.gz"
    sha256 "9b5852bd41bcb79de55e9485c0b0bc14edf24e9845e354ad4bb57d6f90000861"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4707.0.0-darwin-arm64.tar.gz"
      sha256 "b8348954438b63291375a58219f2a6a356817432ffe6e83ab7e1b86d75cafdce"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4707.0.0-linux-x64.tar.gz"
    sha256 "a873de9470ca5028a9b0a910cab97df30b8c502039258496b7dca44629cfe9ef"
  end
  version "4707.0.0"
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
