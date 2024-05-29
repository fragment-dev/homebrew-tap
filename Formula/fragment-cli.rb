require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.29-darwin-x64.tar.gz"
    sha256 "ecab8815d4132351a9b3a54309bd18918e4b2b83b06035332c5ff3ce6d4299f4"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.29-darwin-arm64.tar.gz"
      sha256 "c5e189be68eb8da7ab7a263af77c411bed0b1122d800262cabca66f9138b6381"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.29-linux-x64.tar.gz"
    sha256 "cae286734dbc56d62cefbfb561c20bec5b21b1cb18eae25a54269e400058934b"
  end
  version "2024.5.29"
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
