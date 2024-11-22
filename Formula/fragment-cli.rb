require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.22-1-darwin-x64.tar.gz"
    sha256 "b80cb28c0213ec072fba37c6d99656129715b5c8fae8329f3e94e0cd01c9e855"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.22-1-darwin-arm64.tar.gz"
      sha256 "67b90fb4939e7b2287e54846b5c52910a718c2234117788f9c2f6baee7eb26e9"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.22-1-linux-x64.tar.gz"
    sha256 "ee51e80b8635d9dcd36464e7390e2d492a037956b44058aeaea5785f6e53617a"
  end
  version "2024.11.22-1"
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
