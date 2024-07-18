require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.17-darwin-x64.tar.gz"
    sha256 "0da326fc0ae7af10549fc6675b617ba6c0203d6a6b0287a9efb8713cf2e19238"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.17-darwin-arm64.tar.gz"
      sha256 "b426768b2ab6e539a6038b93855ba923f347aec6147439c2e4d1a7591b0373eb"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.17-linux-x64.tar.gz"
    sha256 "76db258869c08a378e7bb1a93491407ecd480357e98c0827b5fad0973304322b"
  end
  version "2024.7.17"
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
