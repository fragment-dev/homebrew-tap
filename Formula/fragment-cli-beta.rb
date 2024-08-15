require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5512.0.0-darwin-x64.tar.gz"
    sha256 "89200fb4d6221ab74a140d9043be637bb2fbe2e11cabd3ebe4f43e239eb7b2c0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5512.0.0-darwin-arm64.tar.gz"
      sha256 "af19f73491cc7860771d24439e95c6fa745e606787d2ae89d34e7b72c89ca621"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5512.0.0-linux-x64.tar.gz"
    sha256 "dded7da3d1385843a72c9ff1032ccab2c4a74a5e727cd5e61681f4ac4cd860e6"
  end
  version "5512.0.0"
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
