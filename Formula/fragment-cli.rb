require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.3.20-1-darwin-x64.tar.gz"
    sha256 "de14e6c6372953c3bb5c223fa9d682bb3cda8efa44f83a0988869d37e9aa9971"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.3.20-1-darwin-arm64.tar.gz"
      sha256 "6f7e77c339523adaeb55719e96e25d40053669ee21847fc4f895ab725b6c03b4"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.3.20-1-linux-x64.tar.gz"
    sha256 "e98bb32e29feb823ec467830cd6d8c30ff2126fe7f1569986c76be58ba2ca232"
  end
  version "2023.3.20-1"
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
