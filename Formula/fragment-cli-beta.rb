require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2670.0.0-darwin-x64.tar.gz"
    sha256 "90038d0e4ed3ca1e76113d9cbd432a7ff688f8789751874283e16c99e852f120"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2670.0.0-darwin-arm64.tar.gz"
      sha256 "50722e787cc4070e29598471c667a5f27b45edea8edd175950964bf27404604d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2670.0.0-linux-x64.tar.gz"
    sha256 "46bc9d2bdf11a122cc43b05daa5210c19f304978c0a2dcbdc12eae4019f89361"
  end
  version "2670.0.0"
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
