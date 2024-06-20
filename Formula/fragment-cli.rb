require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.20-darwin-x64.tar.gz"
    sha256 "754793f317e854761be2abbe9344f552efad1c22af69ece0890cc86c4e55b93d"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.20-darwin-arm64.tar.gz"
      sha256 "2a0a7fef333a081bd150bb14e074ea93a12121ce4dcb4b92714b8b7c1680f478"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.20-linux-x64.tar.gz"
    sha256 "4077d208c9e5f08e6adfe8e536071eea0c09f1e40ddad0a17a03787f7b9980b0"
  end
  version "2024.6.20"
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
