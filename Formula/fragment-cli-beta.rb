require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4470.0.0-darwin-x64.tar.gz"
    sha256 "e84149f84c006bb3924a83fcddea223e04839496c5f65df684ad63655983cd9d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4470.0.0-darwin-arm64.tar.gz"
      sha256 "be477ffbd46a20ea036b98fc73a74e8bcde2a79ec577ba1f4cc5e8d75132e3f4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4470.0.0-linux-x64.tar.gz"
    sha256 "3e552e1c40c2b68a2b4fe38f5332c105c109b6cc01c3e10621d07c4c98012792"
  end
  version "4470.0.0"
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
