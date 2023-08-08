require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3256.0.0-darwin-x64.tar.gz"
    sha256 "1f2713f31da70cc2e3347a93b2d824c96489e684f4d5e4b56d35babcf21d38df"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3256.0.0-darwin-arm64.tar.gz"
      sha256 "d1290e352ac11b6ea4492a3edf07263a8b7f7b5345d58c932499f6e5bf93eaed"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3256.0.0-linux-x64.tar.gz"
    sha256 "29ef6a619e692141378ed95f2370ff4d785f4b00d040638e966154dbbc26b986"
  end
  version "3256.0.0"
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
