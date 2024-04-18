require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.17-1-darwin-x64.tar.gz"
    sha256 "6447060b9cf1d1938ac9499f878c7c4dd795a5f726109d39b48fcefc2b7b0fd7"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.17-1-darwin-arm64.tar.gz"
      sha256 "70db3084eded39aee943c2902b9103053450f10f4c93c3959d91a26f09ece294"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.17-1-linux-x64.tar.gz"
    sha256 "22b50eabb85f2286f63b38145b4b1dd0707e9336bcfa11c68764140086a0c463"
  end
  version "2024.4.17-1"
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
