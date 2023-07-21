require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.21-darwin-x64.tar.gz"
    sha256 "c62e007129e83fe4a013cf3a87d0425a99aca4ad9483c5019502db58c01953e8"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.21-darwin-arm64.tar.gz"
      sha256 "5752e66aaf4a50037578f8a77f2e78186c7ba0e6749170c8e68006e27a23a438"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.21-linux-x64.tar.gz"
    sha256 "9440df698d4e7de6dc2ba3d59919e905ea4c47535b4db9d4f46b2196e285827b"
  end
  version "2023.7.21"
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
