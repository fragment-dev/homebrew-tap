require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.24-1-darwin-x64.tar.gz"
    sha256 "947f8bd8bf944a705e02d55c99c4b116d491b5a9d843fc148a2bc548746ec575"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.24-1-darwin-arm64.tar.gz"
      sha256 "acb07058ee9e620fca5fb7a780dac67865ff7f26889c7f7f14728165bb553cae"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.24-1-linux-x64.tar.gz"
    sha256 "87dfd8b700c53f5bbac8ddeb2beb8a60e3f592e257589479ff17f4a41de24e16"
  end
  version "2023.5.24-1"
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
