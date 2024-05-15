require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5059.0.0-darwin-x64.tar.gz"
    sha256 "863aa892e2b1e0e8fb0a7b5bff98ed30944cda438460af811c99d5fc07a6bb21"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5059.0.0-darwin-arm64.tar.gz"
      sha256 "6861016c54fe0dd2e0dbaa53cea75e3b22ed61d6a424846d1f7cc1e8132f441c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5059.0.0-linux-x64.tar.gz"
    sha256 "416579419a73010cf3b0abf1014b29906e0c54ab16d0855e2fc4f2beb106a7d6"
  end
  version "5059.0.0"
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
