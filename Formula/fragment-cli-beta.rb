require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5340.0.0-darwin-x64.tar.gz"
    sha256 "7b0cb2033afd53efcb2241f601848d13504f85e29986b9b538160c5f4bdc02f2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5340.0.0-darwin-arm64.tar.gz"
      sha256 "6901bb0f9464377b39637d9f605cb5afcf176ea87f7c85b3553d72a2a95481c9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5340.0.0-linux-x64.tar.gz"
    sha256 "32d40d65a8518149647aeb318894786444e15f8d4a63925b63da5e250e3bd396"
  end
  version "5340.0.0"
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
