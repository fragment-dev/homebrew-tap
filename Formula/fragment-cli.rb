require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.6-1-darwin-x64.tar.gz"
    sha256 "0c9ed9ce838475c82837037d2834feb143c207b029b472828081268197dcc428"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.6-1-darwin-arm64.tar.gz"
      sha256 "8c57b6a0c99ab9dd50c42891b765a5729355956c759f0b427bca76b538a43ed2"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.6-1-linux-x64.tar.gz"
    sha256 "40ff04699a1f15b06a045e990c096ed39633f3144ba3ebc8640af17d995a8b8b"
  end
  version "2023.10.6-1"
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
