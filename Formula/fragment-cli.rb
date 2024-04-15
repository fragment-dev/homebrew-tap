require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.15-1-darwin-x64.tar.gz"
    sha256 "d7092c0358449729839a4c61706126d0618be326f88e2cbebdfe732d09ca2c48"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.15-1-darwin-arm64.tar.gz"
      sha256 "227ca5e9ae3211964f6165adb5e20ff766ab3e86b0924ed1b1ca9f2ca93a870d"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.15-1-linux-x64.tar.gz"
    sha256 "7e17858d273b1ef0fff30254a555da701cf03d68aa4935a402986d6b4b7c09e9"
  end
  version "2024.4.15-1"
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
