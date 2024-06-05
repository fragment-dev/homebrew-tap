require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5210.0.0-darwin-x64.tar.gz"
    sha256 "3a045afbd75336642fc93312040174e11fcfd353f0b28e9cf671d8ce8b19ae19"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5210.0.0-darwin-arm64.tar.gz"
      sha256 "e7e449654eb71da964486793fc149c0ff8ef071a9eebe0fe6824a1213e75b649"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5210.0.0-linux-x64.tar.gz"
    sha256 "31b971ce1f82fa611e98f6826f917a2fcb43e274eed84f2268384cb37344bfa1"
  end
  version "5210.0.0"
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
