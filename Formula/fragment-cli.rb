require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.29-3-darwin-x64.tar.gz"
    sha256 "5c2090a4abe972f1e6cdb34c81eb9f2fd3723e351a51084a484251c31bf322f0"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.29-3-darwin-arm64.tar.gz"
      sha256 "88b9351fb2d9c5342c2d6ca86290ec435802eccd0595e076bb1add1709f54e55"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.29-3-linux-x64.tar.gz"
    sha256 "fa32ca53674ae600a5344af270f5c08d1f4f9673530df54d4dda5921c8bb60b7"
  end
  version "2023.8.29-3"
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
