require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3448.0.0-darwin-x64.tar.gz"
    sha256 "cca8a58e8ded2fe38f018a822eea71ed3397acab5d8c9761c0abb25512eb1289"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3448.0.0-darwin-arm64.tar.gz"
      sha256 "0dcc46b5800bfe82b39f8df897c2f276f43e75913d19a3dc4174939f51da0dc4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3448.0.0-linux-x64.tar.gz"
    sha256 "584bbc6639bf54cfb60c522f9d6ad0c4e08bcefcd5a7b8a0f097fb393e9fe66e"
  end
  version "3448.0.0"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
