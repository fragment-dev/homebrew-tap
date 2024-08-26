require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5537.0.0-darwin-x64.tar.gz"
    sha256 "af554838aa16d677b5c267d28cde2ab20ad5db3c2e181e7829c7f77aa5a015ca"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5537.0.0-darwin-arm64.tar.gz"
      sha256 "5bda3c69cc9a0acd7e389e7a88b24344927fcd2ec3ad0f0ea08c10751b53df24"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5537.0.0-linux-x64.tar.gz"
    sha256 "fe82a1b0d912c677588b0a390c837d7194a8451ca8e754e90971e58d429ab28c"
  end
  version "5537.0.0"
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
