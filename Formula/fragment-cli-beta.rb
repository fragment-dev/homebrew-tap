require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4791.0.0-darwin-x64.tar.gz"
    sha256 "6a7bdc47c58475a88da19cb0ab8aa7d9d950251c76631b4f61c348888bbcde4e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4791.0.0-darwin-arm64.tar.gz"
      sha256 "0517339c57c84c52bbb5c96acc486c18108435aae1a756e7b80dd3c1cfa6ef9a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4791.0.0-linux-x64.tar.gz"
    sha256 "53d03a8d6807fcedb6fb60c693c97d10f7d99c8f369ae51e2c213cb15ec8a099"
  end
  version "4791.0.0"
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
