require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3403.0.0-darwin-x64.tar.gz"
    sha256 "426c931db171677cb697098b47a45f7aae8952def12863c62bc499dd4db406b2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3403.0.0-darwin-arm64.tar.gz"
      sha256 "a40311d34537836dec5d05e9709ffb591b77c7ac0c6bd4f359f1db50070f0b5e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3403.0.0-linux-x64.tar.gz"
    sha256 "addf1ab866b62125454b1ffe928e914958827b4b8f8375ef287cf45a5b71efe7"
  end
  version "3403.0.0"
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
