require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.20-3-darwin-x64.tar.gz"
    sha256 "4168f35db7bc6639fb8663f26eb5a03354af59b402ba7ad900bc2b6f3bb7dae3"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.20-3-darwin-arm64.tar.gz"
      sha256 "881f9357a25c10c859da4293956bef6cbfed4d3d9f073e82dc3cd6e6e4e7ea69"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.20-3-linux-x64.tar.gz"
    sha256 "30ece67da5d4212f7a7b26d01e7a369467b5ba44b8f5d3db2fa7daddb49df5f9"
  end
  version "2024.12.20-3"
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
