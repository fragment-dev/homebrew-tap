require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.23-1-darwin-x64.tar.gz"
    sha256 "454c6e333258cf9f033331a791b27fb40562abfb71b4b4d1ef7deef5e1c88a97"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.23-1-darwin-arm64.tar.gz"
      sha256 "5238bc5249011ee88b6f00d051fb232bc22dddd9c709f2c096f616e883cc8f9d"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.23-1-linux-x64.tar.gz"
    sha256 "abef71e37ae2cb684ef8acd1c61998977b0386d9a4f3924b787dec6eaa38701b"
  end
  version "2024.12.23-1"
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
