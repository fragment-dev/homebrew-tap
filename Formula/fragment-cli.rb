require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.6-darwin-x64.tar.gz"
    sha256 "cca193117e8bce6b5199952e4dfb4d90ff6ae31fec694ff588b46798ca6cae66"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.6-darwin-arm64.tar.gz"
      sha256 "23ccce61157c863c7fcd87ad1367cb5208defd7ab3be59fa070d7e46bc150a31"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.6-linux-x64.tar.gz"
    sha256 "5311803cfab1c525f61c268af087a8f1675a291b15669886745e2b7610e7f141"
  end
  version "2024.11.6"
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
