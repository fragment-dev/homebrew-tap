require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.9-2-darwin-x64.tar.gz"
    sha256 "cf2e4b755ee5eff27faf5a5a267136ae668f18d97544c7058ea0e71eb2804a75"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.9-2-darwin-arm64.tar.gz"
      sha256 "803905e031ebc2c141040bca85d4eb9c29906ef7ff24c09f8b775f3739e7889d"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.9-2-linux-x64.tar.gz"
    sha256 "5ea506bed757fa6c3c357979e27bc4a2ec2a401a62d9fda094742bb6f8bf7ca0"
  end
  version "2024.7.9-2"
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
