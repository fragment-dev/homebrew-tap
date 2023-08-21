require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3346.0.0-darwin-x64.tar.gz"
    sha256 "59114f715c94616ce65d1ec6af1f3af6b7b1aff93f3fd52af19c7d752adc34ad"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3346.0.0-darwin-arm64.tar.gz"
      sha256 "6e64e54a696bf1de75a090794a4be32f340950fe27459c4ea9ff133d876871ee"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3346.0.0-linux-x64.tar.gz"
    sha256 "68b025683d1510bafbe1f34a11ec93c89a9a1b0125d08a0a5ff2542c04d10925"
  end
  version "3346.0.0"
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
