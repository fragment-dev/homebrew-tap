require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.14-1-darwin-x64.tar.gz"
    sha256 "929f38d514918de4e3c4e215cdcb163e8f47b3c44a5e0b84cad449fa76bf5e58"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.14-1-darwin-arm64.tar.gz"
      sha256 "f0892e115bfe3eb50f4fe118096f63211a8f592cf2f7911735a600c368bcdca0"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.14-1-linux-x64.tar.gz"
    sha256 "83d8514ab54deb0c81f2e0744be3140a8805950a1d6594f468d16ffee11de3f6"
  end
  version "2024.5.14-1"
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
