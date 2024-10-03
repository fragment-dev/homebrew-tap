require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5641.0.0-darwin-x64.tar.gz"
    sha256 "83e01337819d9f083eb2cdadc3b137b041e22ff7bc8f67fd138582115d8fff44"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5641.0.0-darwin-arm64.tar.gz"
      sha256 "5995a32605fe23e374395408b869b9d04131f204a16fe6187e0e3ab3ac7baea5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5641.0.0-linux-x64.tar.gz"
    sha256 "029d24cb1c197b3794df6436932cf67c94c1e85d287d3592c5ddc59b273594e8"
  end
  version "5641.0.0"
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
