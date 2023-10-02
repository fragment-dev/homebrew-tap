require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3732.0.0-darwin-x64.tar.gz"
    sha256 "538a83d804132484590d3a7e1fed089185a0947c68da5ef85e366ca6421f69ee"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3732.0.0-darwin-arm64.tar.gz"
      sha256 "0d3023266436789ced62bad9a757be5704f84e718aede106687f584fefbdd662"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3732.0.0-linux-x64.tar.gz"
    sha256 "8e707c2b329e1f96ca5ac034edd684f67e94356cb9e7c63e8ef84b0d751d0f46"
  end
  version "3732.0.0"
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
