require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6030.0.0-darwin-x64.tar.gz"
    sha256 "586d707dfa70e3ec07ae836d2004caf19bfecd07ee5eabfdc7bcb4fead5208ba"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6030.0.0-darwin-arm64.tar.gz"
      sha256 "ead13a95feda7061787a6398a0b797a1f340badc525c9e84d189ec598bd5cc24"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6030.0.0-linux-x64.tar.gz"
    sha256 "dd0466874f8234871cc4f41302943a9b64e1c7565440549198d55f5417295065"
  end
  version "6030.0.0"
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
