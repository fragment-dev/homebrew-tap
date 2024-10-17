require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5673.0.0-darwin-x64.tar.gz"
    sha256 "9d48213a2ad67b60156926ed86365c43e579c8f948062c0c09720126057eef60"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5673.0.0-darwin-arm64.tar.gz"
      sha256 "ab576c70367f1f6227aef7d0b46cd7658d1c2142cea241b1e8015091e6580d08"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5673.0.0-linux-x64.tar.gz"
    sha256 "8afcb529c949166a86e07eb871c0ff77a2332c0a1469e72afb7d003991de6585"
  end
  version "5673.0.0"
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
