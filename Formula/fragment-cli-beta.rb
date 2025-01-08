require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6047.0.0-darwin-x64.tar.gz"
    sha256 "81889768268c1ed648655cf3ed4b810ff4d8212c49ba24e9270e66ed6a750003"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6047.0.0-darwin-arm64.tar.gz"
      sha256 "04b03b77da11edc7b659196d73dc714dd768ee85ebf0cda0767cf9a30b034cce"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6047.0.0-linux-x64.tar.gz"
    sha256 "1908d78068c21d599994e375365f348ee3c166f28430ad1b5ba2a4a39169a411"
  end
  version "6047.0.0"
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
