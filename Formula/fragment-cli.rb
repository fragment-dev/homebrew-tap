require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.20-darwin-x64.tar.gz"
    sha256 "17cade3e753d67c8a0990e0ec015a8a7202de138dae460e63adbb2652bc39ff5"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.20-darwin-arm64.tar.gz"
      sha256 "77018d6286a3dd8b40f8f3479d20f97e7b74eb1cf92a15b615a6e362d489e0e7"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.20-linux-x64.tar.gz"
    sha256 "dff7e83b2b81446c81ffb0c63db0843b058b0757e20cca4f14ba399e55128e5a"
  end
  version "2024.9.20"
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
