require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.29-darwin-x64.tar.gz"
    sha256 "d69b11d5884f4f042797b8070e1eaafd7b9eff5c6cdef20512e6d896e0818bf3"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.29-darwin-arm64.tar.gz"
      sha256 "85ecf10672cad85e62910822d0bb95d1c89481a16cd1ad16f5ecdb1bb0277825"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.29-linux-x64.tar.gz"
    sha256 "7e5916cac89f3e4814c8e9ed366d4a849cb42f255f0ab758dac8fffd79109068"
  end
  version "2023.6.29"
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
