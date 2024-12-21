require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5952.0.0-darwin-x64.tar.gz"
    sha256 "a8f11a349f02310d4118abf251dab669368bab4a5ad05aee8f06e52945f05389"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5952.0.0-darwin-arm64.tar.gz"
      sha256 "ed54d8d299b554d9498e8bbc307e6fcaa4231b7bcd16039baf38048d51d1a50d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5952.0.0-linux-x64.tar.gz"
    sha256 "4e4e76f6c3f399822b15a1ad58df2807b91070c23d402e107b0825bdf1665209"
  end
  version "5952.0.0"
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
