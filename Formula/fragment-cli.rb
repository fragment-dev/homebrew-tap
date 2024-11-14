require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.14-darwin-x64.tar.gz"
    sha256 "9c7df193825ac4734e4df664583599fd6ee05fe6de6c944210b78407a6b63ff2"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.14-darwin-arm64.tar.gz"
      sha256 "cca6ddeb458b0c2b0a8028545fd26d9e05d794e769ff01d69c2473a7f56071fa"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.14-linux-x64.tar.gz"
    sha256 "562e3f88fa59f0798aafb08df2b31077dd3d0daa19ac885ec4ead9a9f0b0c11c"
  end
  version "2024.11.14"
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
