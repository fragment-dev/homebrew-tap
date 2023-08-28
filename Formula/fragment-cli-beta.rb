require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3409.0.0-darwin-x64.tar.gz"
    sha256 "00db2a82a176ea8460e0adb1a65b6a07e454695d0f8aa426befbfb690be54b4d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3409.0.0-darwin-arm64.tar.gz"
      sha256 "d86022de0d3e7263f1402ec565581bb6d42a716e671b52470f61d0fbeb0b45d7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3409.0.0-linux-x64.tar.gz"
    sha256 "3b9a190572010bc08035c81d3f152d040e1372fe2eb0affba4c5f09e7f743da6"
  end
  version "3409.0.0"
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
