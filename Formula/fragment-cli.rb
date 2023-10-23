require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.20-1-darwin-x64.tar.gz"
    sha256 "923e15fe6d7cd2baaf193cca7b5ddd1b0a193380d27b2cf0273069e9ef643e3e"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.20-1-darwin-arm64.tar.gz"
      sha256 "bbac9e785654f5ab5e04e9800d34d5b4ab3995664d6e6d4b8e150fc9660f5882"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.20-1-linux-x64.tar.gz"
    sha256 "109ec1975a095b0523a72e469f76abb5bafc132e6c95090579d336a4246763f8"
  end
  version "2023.10.20-1"
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
