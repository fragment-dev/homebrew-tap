require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2630.0.0-darwin-x64.tar.gz"
    sha256 "5ed3dccd3a059488dfd7647eb1dd7d1ee611cc399ef9ff6e6619999b07d6c837"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2630.0.0-darwin-arm64.tar.gz"
      sha256 "54520d132fd8d4e481f6c695c63968410295edcac6172461f41f177536a1e8b8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2630.0.0-linux-x64.tar.gz"
    sha256 "3a80b6288d9a2bde16ea75250ba9daaec291891f1152255f67daf8d4c6567760"
  end
  version "2630.0.0"
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
