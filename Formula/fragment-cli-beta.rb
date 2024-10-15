require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5664.0.0-darwin-x64.tar.gz"
    sha256 "91bbafa1c490d0546dc4392b41da70d9e453d55dc196a0606bae7b0a38c829d7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5664.0.0-darwin-arm64.tar.gz"
      sha256 "014be4c9c7fce604f8319cca99980dc106b3baba97e3ec56de1f8af65a6070c7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5664.0.0-linux-x64.tar.gz"
    sha256 "bddbdb1a55f3063b4f7d30aa8a74973f0c3841969a9291a1bdda9d05f5074484"
  end
  version "5664.0.0"
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
