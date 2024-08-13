require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5502.0.0-darwin-x64.tar.gz"
    sha256 "dc915d783024234a2e85dc567db2a85863fb0e0cabff30c7d5d12f66413d5aa7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5502.0.0-darwin-arm64.tar.gz"
      sha256 "c4f555ab6d72c0061178649b2d531b9d34790282f43e2053498adb609ef05990"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5502.0.0-linux-x64.tar.gz"
    sha256 "8bc15280d1a81ab656641491b20466ae492ad3ca8c95a265d9ccc8dff555bed9"
  end
  version "5502.0.0"
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
