require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.21-1-darwin-x64.tar.gz"
    sha256 "202a55002eb769f6ee531638258c93959025c84172365901357107881f0c024d"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.21-1-darwin-arm64.tar.gz"
      sha256 "a1a61ece489c877a7883a6d082582f43f9f8bb7dae9d54ee853df8c74692d2d0"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.21-1-linux-x64.tar.gz"
    sha256 "2faa1a47854a2a492803147849ae75b19ef2afdade311783a75bf462b6956d38"
  end
  version "2023.6.21-1"
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
