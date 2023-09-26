require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.25-1-darwin-x64.tar.gz"
    sha256 "85be89c6d7fb67e7bcf724dcf93e5cf3c40e947f877e928c680bc56a8cc1232b"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.25-1-darwin-arm64.tar.gz"
      sha256 "2a488ab147f768a87f7c54da80ccf31340b5e5963910f3c9dc70b92f76083a26"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.25-1-linux-x64.tar.gz"
    sha256 "8c6d05e673cf3d4237cb9af628a926b9a4f30ff642a57f71be60fd58840e5de4"
  end
  version "2023.9.25-1"
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
