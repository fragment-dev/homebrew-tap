require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4230.0.0-darwin-x64.tar.gz"
    sha256 "b0c8c9d80546f9cdb26dd94c4e7fb36f16c90453f91bea4140d3e3b76141a5c9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4230.0.0-darwin-arm64.tar.gz"
      sha256 "e2a9b5b6278b80fae37fec8e655bae9ee21813d21be2f06559ed9901f4df6e4c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4230.0.0-linux-x64.tar.gz"
    sha256 "f3ff582b4d754c170b08059f0c244474b7115f5a213305cb74f30887c2f5281b"
  end
  version "4230.0.0"
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
