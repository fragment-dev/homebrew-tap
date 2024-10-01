require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.30-darwin-x64.tar.gz"
    sha256 "010b8a82852e4ef5c1d41f4d8e680b83624e41e2051c1cbad120e1654c5dacec"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.30-darwin-arm64.tar.gz"
      sha256 "3d0c844d56c434784e4310c0ab6f4b06aa1a5931bedf2ea2f53a478ae7d8089a"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.30-linux-x64.tar.gz"
    sha256 "21055498e9b9b59d257b0c44b0f9185ca3c58839a1b8643216380cc92197a542"
  end
  version "2024.9.30"
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
