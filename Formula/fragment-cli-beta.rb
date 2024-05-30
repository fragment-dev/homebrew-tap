require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5156.0.0-darwin-x64.tar.gz"
    sha256 "301127f752c29d8318ac7758f7d732a8bc5560efc42e58b47fd2dfbe6577016f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5156.0.0-darwin-arm64.tar.gz"
      sha256 "8bcd46ef797d0e766c22fcc3ea37a26ee78a4fc98b608993dfe47db94489460c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5156.0.0-linux-x64.tar.gz"
    sha256 "157ee9a481ceaf9cea14724a1efa69c68042fdc755dbcd273bd7227cc382f5b1"
  end
  version "5156.0.0"
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
