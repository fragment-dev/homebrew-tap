require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.19-darwin-x64.tar.gz"
    sha256 "33b86ae55f712e3cafe0a46240b3e343ad880112355aeec1785b3fc1f230d8c0"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.19-darwin-arm64.tar.gz"
      sha256 "3eac88c25911dc8ef381512fe0dd954a4c9a723c930bb796d06bff40e358c4fb"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.19-linux-x64.tar.gz"
    sha256 "67211fed15303f3983b516bb49286476cdc704223679d213363b9aebdbf57404"
  end
  version "2024.1.19"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
