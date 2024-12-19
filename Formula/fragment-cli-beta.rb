require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5924.0.0-darwin-x64.tar.gz"
    sha256 "f8f5f2d940a6ab08476bd6399859d8c6cb4ed9eaed244b11c522bac35b3b85bd"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5924.0.0-darwin-arm64.tar.gz"
      sha256 "ff5329167b1c277a11933c701b6ef3299b35541ca35ba5d13c0993e17d447f37"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5924.0.0-linux-x64.tar.gz"
    sha256 "fbebb2fd00e4bf5a5b3417b553f49da7876590e5e2ff7e47e49ee951ca9f989c"
  end
  version "5924.0.0"
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
