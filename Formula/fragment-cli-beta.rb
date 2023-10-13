require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3821.0.0-darwin-x64.tar.gz"
    sha256 "023a7ce8078f631af601894bbc98c5b864d9e70cafdf0eff01bb4068e2af75ba"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3821.0.0-darwin-arm64.tar.gz"
      sha256 "227a9aae69e83a2b86fbec26b066efc1c43542eed9c4c567a79b262a10b6c085"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3821.0.0-linux-x64.tar.gz"
    sha256 "681065a0efe36defbc59318951ce54f07dfd9d53ef408cb8c0c65df9ca82fa49"
  end
  version "3821.0.0"
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
