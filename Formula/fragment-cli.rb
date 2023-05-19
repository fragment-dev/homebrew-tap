require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.19-1-darwin-x64.tar.gz"
    sha256 "5f8c0cdb5b654f89ec2279561589fbac0a18bcf2e2feb6f6db90b7c979b2b1df"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.19-1-darwin-arm64.tar.gz"
      sha256 "73ffc98a9d47781719234c304dd0c0a71e70abdff4dd44c7f439a1887b521016"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.19-1-linux-x64.tar.gz"
    sha256 "90c5b3c269bc2ca94af401e0cd5d20230ef7c01bfbaf91627842799157ffe55d"
  end
  version "2023.5.19-1"
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
