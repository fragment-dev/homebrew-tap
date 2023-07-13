require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.13-darwin-x64.tar.gz"
    sha256 "5354458c33782f14867f76656f2655f362523e0d8f8805d377af96a862637fc8"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.13-darwin-arm64.tar.gz"
      sha256 "1a3aca89ef80ee9def999e64f0dae78b3d519c452d3ce8d724ceac7c9c81e6cf"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.13-linux-x64.tar.gz"
    sha256 "b94b07cbe27f7f56040b1dea84cd0d6d97eef2ef9f11f15a1a3c0060baa05a66"
  end
  version "2023.7.13"
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
