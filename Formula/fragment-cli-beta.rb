require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4513.0.0-darwin-x64.tar.gz"
    sha256 "2a4e2ca923a87e848d637bff8483964744b4dcb4a9d0f6723e0caf0792b0ece9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4513.0.0-darwin-arm64.tar.gz"
      sha256 "702e5eb323e52afcaffa29d67c553643e92c015178332d164cfa54f168116ab4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4513.0.0-linux-x64.tar.gz"
    sha256 "3842b41ebaed7df6472a808f8f3e73c36976d090d712202fcf8251c57a656e48"
  end
  version "4513.0.0"
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
