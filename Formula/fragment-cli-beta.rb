require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4792.0.0-darwin-x64.tar.gz"
    sha256 "2568f78b9e864a215343a929e64d7948cf55146b090b5533cc6ff47083a4172d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4792.0.0-darwin-arm64.tar.gz"
      sha256 "3880c5c3693a1a0adf361ef18b9cb528c7da0121a2e661ed1d5f9c2718d82b75"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4792.0.0-linux-x64.tar.gz"
    sha256 "2fe7d38e45fa7c2a35b6d2bdac42638db8a6c87e1ce50fd5043a92a391a23de7"
  end
  version "4792.0.0"
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
