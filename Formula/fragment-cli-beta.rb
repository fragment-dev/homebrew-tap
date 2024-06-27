require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5322.0.0-darwin-x64.tar.gz"
    sha256 "1a52ee11e64a1d90c4a1ec13e00b99fd5da4bd53d003cf2baedfde7a9aac5043"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5322.0.0-darwin-arm64.tar.gz"
      sha256 "b7482d2d64a138f19c89b009ac9aca902d4f204aa9e39ee725c79c3da7620678"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5322.0.0-linux-x64.tar.gz"
    sha256 "a295cdeb7efdd6675eded60a3ad218e4e554b34b99416c807e7cb77aa13cd810"
  end
  version "5322.0.0"
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
