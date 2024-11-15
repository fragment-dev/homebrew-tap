require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5772.0.0-darwin-x64.tar.gz"
    sha256 "315d0ed6be305d9cb69ced4e439ef5613dc6a48aac7f8833d36e3a9a78abbb5e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5772.0.0-darwin-arm64.tar.gz"
      sha256 "0dfd9ff6d67523cf994bcca3e9c3b3ca223be070efefcf071d129c04fe4f800a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5772.0.0-linux-x64.tar.gz"
    sha256 "ec1305bc9a5b1c424875c6ca0097bf5e504a4a299de1a8ddb54abaeae2b0c8b0"
  end
  version "5772.0.0"
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
