require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5946.0.0-darwin-x64.tar.gz"
    sha256 "a0438548fb6f863b992ad9e71a218a45ba20600fcddd0bf6a64e88793d5542a1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5946.0.0-darwin-arm64.tar.gz"
      sha256 "b69f8d65ce4b2075020e9a0e999d82291d87d9447dde3091d496305ff7ae0325"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5946.0.0-linux-x64.tar.gz"
    sha256 "004f0efbc757895fe95509ff94331a82fc09c3c1b6d33883177130ac3527dbbe"
  end
  version "5946.0.0"
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
