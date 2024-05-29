require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5140.0.0-darwin-x64.tar.gz"
    sha256 "2edee0e0959da4dec8ec51f500b056c1c019f521bdc7002ad4d9a44ce27234ca"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5140.0.0-darwin-arm64.tar.gz"
      sha256 "c9b3b32996ffb87efba10cb1c9503cf1b7e5f70b9aa9b61d5c759885f6223837"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5140.0.0-linux-x64.tar.gz"
    sha256 "a1c39719e0a1734dc49b7e7d509d7aba636eef024895a0cad5382d9a7097eaa8"
  end
  version "5140.0.0"
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
