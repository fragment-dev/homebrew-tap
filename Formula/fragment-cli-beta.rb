require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5667.0.0-darwin-x64.tar.gz"
    sha256 "1797646306f59ed7d4311f4c81c1d76f1c96edcdbd5a594c991aa784af24ef5d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5667.0.0-darwin-arm64.tar.gz"
      sha256 "619e08aeaf002ed4fc090ad1fc51f01b64c74ff19676b6a5721e1385dd53b118"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5667.0.0-linux-x64.tar.gz"
    sha256 "98d8b993e930e6263a61aee554e8c9fb0e8a8f3cd83958c2898f193bede059cc"
  end
  version "5667.0.0"
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
