require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5925.0.0-darwin-x64.tar.gz"
    sha256 "b958701361556959cf332a573201229e25d5833f96f3062391c3387f691ef117"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5925.0.0-darwin-arm64.tar.gz"
      sha256 "a7d44eec4a0d057dd3e7f6882bb1b450f80f4e6d4359e3de3b5f43f31cda4862"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5925.0.0-linux-x64.tar.gz"
    sha256 "5770a6109158efd0c50c06baac60d49b83ec35e81b96eae01d69e7dc6d61229c"
  end
  version "5925.0.0"
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
