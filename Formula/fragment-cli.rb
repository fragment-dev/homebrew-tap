require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.22-1-darwin-x64.tar.gz"
    sha256 "496fab0efb0f44eae9df4feb3e2ae45353eb156aeaf5218875b930bf7e9722bc"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.22-1-darwin-arm64.tar.gz"
      sha256 "60fb01bb82a6c344a5dfbc856610de49cc49fd0121106e40bb1678c677432a37"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.22-1-linux-x64.tar.gz"
    sha256 "43bea1e5a68ea850ff35ad051e643470516d7afc871e6b41b4288c6cf1747ef2"
  end
  version "2025.1.22-1"
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
