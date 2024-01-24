require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4427.0.0-darwin-x64.tar.gz"
    sha256 "d7a6b39a7f7e076d10fd3daa8e5fd8961c1e4c3df8787a0f493fd213a0013f79"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4427.0.0-darwin-arm64.tar.gz"
      sha256 "63097692d941c212d7d281c97999b4dec3e733ab1d7495a46f1690884b9564d9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4427.0.0-linux-x64.tar.gz"
    sha256 "4be0e303fde99da92e0ed9edac8a707765e9270f9b64ee5f1a46c226c71f5255"
  end
  version "4427.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
