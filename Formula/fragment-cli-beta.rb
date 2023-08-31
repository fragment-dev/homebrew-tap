require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3449.0.0-darwin-x64.tar.gz"
    sha256 "32841160e781c7808cb9ef9771a5fdafa1921330663d8e1d0a99201fe62dd0d2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3449.0.0-darwin-arm64.tar.gz"
      sha256 "39ef860fb3149ceae7a612a24ae4ae759f2962b52091bf16f170e8f3394254a2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3449.0.0-linux-x64.tar.gz"
    sha256 "9dee31df78659e6a5c34d8433f6f4d844aadd3d4a9b181b07cebbc15042e42de"
  end
  version "3449.0.0"
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
