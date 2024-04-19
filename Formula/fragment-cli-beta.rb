require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4925.0.0-darwin-x64.tar.gz"
    sha256 "b70800f50fe36597f1d56b09a8e515e2a541253bd16be6171842f65bf2d99261"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4925.0.0-darwin-arm64.tar.gz"
      sha256 "e8741f96f0355063c43e7b132f52b52806884fd0d4f663e937c3568042c70741"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4925.0.0-linux-x64.tar.gz"
    sha256 "1707cee0435a43ca633997a046f376a0d6ca9b496360746ae74e098bcf713917"
  end
  version "4925.0.0"
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
