require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2874.0.0-darwin-x64.tar.gz"
    sha256 "e4a420d5cfc8c71ece3a05102376c1d347886a0c8a05cf12c99c718699e8dc51"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2874.0.0-darwin-arm64.tar.gz"
      sha256 "1c5afbaabdc000915d7d4436ed58d54c13b03dd535339b8c3731d5443c19fd1b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2874.0.0-linux-x64.tar.gz"
    sha256 "28da64789c7f093fe52ce04648359b9d5a37479c30de5bce7b928a3eb8cc895b"
  end
  version "2874.0.0"
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
