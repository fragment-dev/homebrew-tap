require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3289.0.0-darwin-x64.tar.gz"
    sha256 "3a0b79aceadf1d9bb6a4140ea3de526bde2c8215ca649ad2e22f072229ea9e5c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3289.0.0-darwin-arm64.tar.gz"
      sha256 "e40eb6186edc08c63fcbc46f558b79eb9f7d4180291f0332c14294028a41e7cf"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3289.0.0-linux-x64.tar.gz"
    sha256 "4957fcff3af67a93782bd2189de975a344d69c482a33de05b81e07698bd87576"
  end
  version "3289.0.0"
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
