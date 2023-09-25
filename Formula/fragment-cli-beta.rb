require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3660.0.0-darwin-x64.tar.gz"
    sha256 "c5881af86cb35ee8056aab0356e1222bc004e0647541e59b78730e0b50ebd03d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3660.0.0-darwin-arm64.tar.gz"
      sha256 "fcb0f86eb0536757ea580b0a5f77ea8f69ff69155c3f8bc7eea9c49240c86ed1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3660.0.0-linux-x64.tar.gz"
    sha256 "033011a9be7d8a01c1a1df8618f46297997f317b0fb559d8ac9646884eda2c8e"
  end
  version "3660.0.0"
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
