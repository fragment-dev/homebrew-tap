require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.28-darwin-x64.tar.gz"
    sha256 "6d7a858adc02bbc29693aa63a656bf9153a4bacf57e6baae756a7f555324c8eb"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.28-darwin-arm64.tar.gz"
      sha256 "acb5b4ffbbdd214748dcf50437851d0671f0c1e11cc5e057c7cd37ac0e2bb408"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.28-linux-x64.tar.gz"
    sha256 "77cbedf5667ed24ade07896d449d59e333512223ffbed447474fc8adbccdd359"
  end
  version "2024.8.28"
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
