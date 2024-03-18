require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4776.0.0-darwin-x64.tar.gz"
    sha256 "da6ee2a8db0f98476a6a70b86cce6c1ccb0720b338265dab74f839be7e44f8a1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4776.0.0-darwin-arm64.tar.gz"
      sha256 "ac8481aa3ebdf18b4559a1952f3f001054fcb7a469ccc6e7dca0d60244b8bb30"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4776.0.0-linux-x64.tar.gz"
    sha256 "a0057fdcae2f4e58432e03512aa73ed23c991a419308c4cc6f678801a0524200"
  end
  version "4776.0.0"
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
