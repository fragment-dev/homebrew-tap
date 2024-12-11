require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5873.0.0-darwin-x64.tar.gz"
    sha256 "9deff918dafa7b9bde1456f4fbb46f8a09c2038f24f655e6cde1ed21b598e7b3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5873.0.0-darwin-arm64.tar.gz"
      sha256 "698beaf730968bce5f617dc97dc88dbacd879f8a4dc99efe05c7cf4c2098c1f3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5873.0.0-linux-x64.tar.gz"
    sha256 "5f325f906179fc2f4b3dcc337e9ee31703648ba7faae2b6422710a05e8f8d782"
  end
  version "5873.0.0"
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
