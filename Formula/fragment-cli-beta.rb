require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5675.0.0-darwin-x64.tar.gz"
    sha256 "c0eefff1aa6fa3644ed62e60a778ab7d6bdb7c36c8396fbc0b8096bb0943a70c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5675.0.0-darwin-arm64.tar.gz"
      sha256 "9ece09da14212837880afbd5a5090fbba88d368e24929381ae5d7c598105aaea"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5675.0.0-linux-x64.tar.gz"
    sha256 "373dc46661f52fee77a6136b6e3ee7869aecc35bd523ffda375490c503312025"
  end
  version "5675.0.0"
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
