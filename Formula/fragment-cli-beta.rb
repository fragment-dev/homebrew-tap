require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4933.0.0-darwin-x64.tar.gz"
    sha256 "9556f4ba26a676dda7d7d5a9db88a9d4f200d30ad83b904d7d578e1a082e575a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4933.0.0-darwin-arm64.tar.gz"
      sha256 "17f4df733fe91d4a2ecc310c35ab107b057e704b7636156dd11086a3cd6608cd"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4933.0.0-linux-x64.tar.gz"
    sha256 "39d1ad5064a93c0271e6f925a1c1c8c53671256cf6afee7e0d4c34b33ae770af"
  end
  version "4933.0.0"
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
