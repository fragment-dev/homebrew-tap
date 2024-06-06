require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5226.0.0-darwin-x64.tar.gz"
    sha256 "780a2f52aaa09adcc197bb6ea58d670132f452edc4dd18b7043737d982919314"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5226.0.0-darwin-arm64.tar.gz"
      sha256 "be47bd9bd08eb275c531ee4b00ec4ae3f32aaad84b4ae8fb21ca0a88aff0ad75"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5226.0.0-linux-x64.tar.gz"
    sha256 "0884461e95bc5d1002d1b5f7b799b0170c0f08950270bc3dd21fc9c070f233cd"
  end
  version "5226.0.0"
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
