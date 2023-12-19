require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4166.0.0-darwin-x64.tar.gz"
    sha256 "bb2cadd5eee2c8dd34ab0be641ba4276a3f17fd9a0d87da9d5a7b4583a47c75e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4166.0.0-darwin-arm64.tar.gz"
      sha256 "b0c34c4475042794a7f6f5dcf93fecb239d1e2aed1d9245b45dfd2f57e86ec78"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4166.0.0-linux-x64.tar.gz"
    sha256 "f25eae453d7957b41c5cc7d0752a10fae7e21b00a27941d61cde950923729369"
  end
  version "4166.0.0"
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
