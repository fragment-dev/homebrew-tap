require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4646.0.0-darwin-x64.tar.gz"
    sha256 "3e9d4e7ef03e7c20b42548b5d27f1f8f4f790f20ce389b9cec12f8525da5c376"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4646.0.0-darwin-arm64.tar.gz"
      sha256 "79478a186494e163732f133e93439ad2bc47fb5be63345f5c02f4bbadf578404"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4646.0.0-linux-x64.tar.gz"
    sha256 "9b33e3ba5d5103b5abaf6b395a8ed17fce70a0fad0eff7a3bdc1089b122085b6"
  end
  version "4646.0.0"
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
