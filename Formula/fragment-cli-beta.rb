require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5205.0.0-darwin-x64.tar.gz"
    sha256 "83b8e7717d04d7d68a4f04bcc17d2f031f99ba92c7cf1cd29f4c787c6c8623ea"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5205.0.0-darwin-arm64.tar.gz"
      sha256 "e9f52b88c0f87cb759666669ecdbbeb97301c9a0866cdef6dd5648fa9d522932"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5205.0.0-linux-x64.tar.gz"
    sha256 "a25c10e1a1534165d8fc9bc5582b3a44a04d5b531cb988fa25df9cd02377ac97"
  end
  version "5205.0.0"
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
