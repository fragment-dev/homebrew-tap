require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.18-1-darwin-x64.tar.gz"
    sha256 "ba3434f92c68272275101c9b81b040b06877b9aca1a6c25c6e52d801f7a670d1"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.18-1-darwin-arm64.tar.gz"
      sha256 "a419b087cba9f226f1d22bc469cfbaf64ccabb5bd22ec2e92e2af5d14c227e8a"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.18-1-linux-x64.tar.gz"
    sha256 "ca02a5b60fda3b64f12cf87cda60588d2d64f9e5235461d13d4329bf57a69e48"
  end
  version "2023.12.18-1"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
