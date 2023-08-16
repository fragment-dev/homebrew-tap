require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.16-1-darwin-x64.tar.gz"
    sha256 "8de5ac7802e79f785e06f98a37bd75a7e252065abe7c0198f649136f3d75f73d"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.16-1-darwin-arm64.tar.gz"
      sha256 "734cf8346c42ee04ba35654dd0cc34f33fbfdda67a7c438bf7800bec9d5c8199"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.16-1-linux-x64.tar.gz"
    sha256 "9d8b36cf5c019004a5cfabbc018f82218bb923126f42ef6e790a7a55f65c0367"
  end
  version "2023.8.16-1"
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
