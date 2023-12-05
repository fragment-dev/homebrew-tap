require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4088.0.0-darwin-x64.tar.gz"
    sha256 "85b0820d28a0a00da97d5684f7db3a6a2bc02f433d91084370b356c33ff13516"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4088.0.0-darwin-arm64.tar.gz"
      sha256 "8f9a158481ffaa5f8acd63ae1dfdcae9f168a3b42fe659a8723e8bd001042e17"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4088.0.0-linux-x64.tar.gz"
    sha256 "aa34176e0c754b10167d6aee7d217d88fe427db96a501a6013eef479ef85f1be"
  end
  version "4088.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
