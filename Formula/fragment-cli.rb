require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.17-darwin-x64.tar.gz"
    sha256 "d4693a4c9dae4b83977c242fb8c498534e7d8fc547f03568b33fdd0420ce6587"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.17-darwin-arm64.tar.gz"
      sha256 "6dbb7c5d18ce2b13802dedc409e2ed4b7afd3605ff6b90e10f19b6c1354d963c"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.17-linux-x64.tar.gz"
    sha256 "abc5b1335cb679560616ec38ae3a7aeb3c61dc1ca8f1fd7d041118452df37b4d"
  end
  version "2023.10.17"
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
