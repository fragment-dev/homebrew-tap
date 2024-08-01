require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5461.0.0-darwin-x64.tar.gz"
    sha256 "ba0f17e2699926ab61da7c4604a386adb628bda54d946a2d090173de8c0b00ac"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5461.0.0-darwin-arm64.tar.gz"
      sha256 "84221844d3027583f9c75b54ec3f3758507aace0c27d6a73f7257f5102203241"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5461.0.0-linux-x64.tar.gz"
    sha256 "ae2aa18305557b260aa8a9f89cb296108a80ece61d6092d3645e3fd8d2bd166d"
  end
  version "5461.0.0"
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
