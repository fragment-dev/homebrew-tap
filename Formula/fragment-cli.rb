require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.5-1-darwin-x64.tar.gz"
    sha256 "67135637cd485beeb6417e42ee772d6111496097ac1d9c3a3063ec372e05bba9"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.5-1-darwin-arm64.tar.gz"
      sha256 "4c9b4da871635c9a091ba9045bb74c76c7ae0c7c60dbd098184b6e4276ba8b66"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.5-1-linux-x64.tar.gz"
    sha256 "f78dc8e8661a937caf1f188bbe9a2e7b1c33624a6fa40f45b1dd9ce3bdcc4408"
  end
  version "2023.9.5-1"
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
