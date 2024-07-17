require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5402.0.0-darwin-x64.tar.gz"
    sha256 "b6f9c98a077aefc14b7700a003e283ac65c50fa0648d1dac4ac5fb5a0bf672d0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5402.0.0-darwin-arm64.tar.gz"
      sha256 "cdd3e2c8b7d93ab9bae9a5a94aebe13c04a19aab9408595eef8fb9bec2dcec21"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5402.0.0-linux-x64.tar.gz"
    sha256 "9070289323297bfbb7cf632d4a989d9fc029ad9ecdbe9aa6a4bb3239459649da"
  end
  version "5402.0.0"
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
