require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3514.0.0-darwin-x64.tar.gz"
    sha256 "23b48e1a82b412ab841b2507e76e3c430cce5af46aaac56560e00181af878f57"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3514.0.0-darwin-arm64.tar.gz"
      sha256 "1e30006e2c4030197b699e8d5a81bbfeacae6d8e242c23dd28dda23090005b61"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3514.0.0-linux-x64.tar.gz"
    sha256 "1caa3f0caa016bb3b01c680a529e10ed652c42dcbc26e45c88c445186f866b8a"
  end
  version "3514.0.0"
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
