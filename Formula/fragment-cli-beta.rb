require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5083.0.0-darwin-x64.tar.gz"
    sha256 "1d91d65343adc947d7f241e1ea1c77f83318f99c5aec4e6ff16c061bd74108c2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5083.0.0-darwin-arm64.tar.gz"
      sha256 "85ec8dad5bb53143a33a567e339b01802b883b541f880608872ba96fde065572"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5083.0.0-linux-x64.tar.gz"
    sha256 "cb6940bbdc8fa27736152f18aecae25cb69582d5b36f05474c72802a43f70ed4"
  end
  version "5083.0.0"
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
