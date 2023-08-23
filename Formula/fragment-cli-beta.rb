require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3373.0.0-darwin-x64.tar.gz"
    sha256 "44ccdd70e078a527e6cea5889bcffb417aa192b360678ab78fef2cbdf6fbcffb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3373.0.0-darwin-arm64.tar.gz"
      sha256 "600c3f2ec11ba0b8747971698d615cb52276e102cd0cf1942f7404b8de1e936c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3373.0.0-linux-x64.tar.gz"
    sha256 "ae5bdfd815528016f79f04df298bd4fcad0bdc20e8e5f92be2e29c345e47e38f"
  end
  version "3373.0.0"
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
