require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5893.0.0-darwin-x64.tar.gz"
    sha256 "36a5a7533d8930ff95f23766457ab2f1c88e9f1fee32d6dd79023cfd7f88fd48"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5893.0.0-darwin-arm64.tar.gz"
      sha256 "d633f82d372d2262125ffd50ef293856b40fce8a10f2efbb61c7ec5612fc37ef"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5893.0.0-linux-x64.tar.gz"
    sha256 "f34a141c0b05f5f61278ea1c31c9f4b87b46ec9e8a411639d729f914b0aed7ab"
  end
  version "5893.0.0"
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
