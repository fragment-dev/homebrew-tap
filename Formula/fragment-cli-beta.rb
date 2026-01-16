require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v7637.0.0-darwin-x64.tar.gz"
    sha256 "8be0e85fc7b88827dc8f3a77d5178059d49d298e2cec717fb17bb0544d9df2ae"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v7637.0.0-darwin-arm64.tar.gz"
      sha256 "01880fd7374c2631c52bb921a8bbd96804701aab6d174b88525c09a183da10d8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v7637.0.0-linux-x64.tar.gz"
    sha256 "5393c7782214e7cd3dc6552fc84255b87d9992d4b1b3bdcfbb5418b6512de2e8"
  end
  version "7637.0.0"
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
