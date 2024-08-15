require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.15-1-darwin-x64.tar.gz"
    sha256 "6639368ae63eb7b128d163e6f1c9394fcccdb3c1e6abe9e751a3c1a14a7422e2"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.15-1-darwin-arm64.tar.gz"
      sha256 "9f973d0459bbc84eaef71bf29015b85285e94b973c4487973b2cd3367bb24e0d"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.15-1-linux-x64.tar.gz"
    sha256 "cbbd21cf513827dfeb2e5ab87c4933e83bc2661277fc76153464468970a2063f"
  end
  version "2024.8.15-1"
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
