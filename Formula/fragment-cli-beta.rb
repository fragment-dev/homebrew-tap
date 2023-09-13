require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3544.0.0-darwin-x64.tar.gz"
    sha256 "c7c58610fa576160ea3e51c1aea7870a947685d504fbfcc3b43feaf8f7ddf16f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3544.0.0-darwin-arm64.tar.gz"
      sha256 "5e0a4267c3a98172bfd7693d406f12e43cd1f26f963256db03ba6a2ce698f0ff"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3544.0.0-linux-x64.tar.gz"
    sha256 "7b21905d7edc0494908a765d6080bf37b94f3dd2b8b653ebe96abc59047585f5"
  end
  version "3544.0.0"
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
