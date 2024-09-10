require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.10-darwin-x64.tar.gz"
    sha256 "bb36646f0f56216b921fb2173c7e68212b57131fd50fff1c608f21fd4f72809e"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.10-darwin-arm64.tar.gz"
      sha256 "cd24fd7d55fc2264bb7cefd02985e4e46802658a2e2c616c6fef309a2aec3caa"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.10-linux-x64.tar.gz"
    sha256 "7c6254c5bfa9c2ebb2853dd9362313f028ba097da47963c606eafd9e4788245a"
  end
  version "2024.9.10"
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
