require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4506.0.0-darwin-x64.tar.gz"
    sha256 "502d7aa4f651d433183a606963e7d0bb65d4445d32724806c4d771b22602c818"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4506.0.0-darwin-arm64.tar.gz"
      sha256 "a9ff728dde0554df88b4f123fe4c7cbcd12c356e580b9ab5c5044ed21786af39"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4506.0.0-linux-x64.tar.gz"
    sha256 "6ba0d8b477dd80097b2ddd4ae243b635f4f51a8f90ae5e3329a098fee9b4d673"
  end
  version "4506.0.0"
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
