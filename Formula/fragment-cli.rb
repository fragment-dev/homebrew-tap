require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.17-darwin-x64.tar.gz"
    sha256 "feebbf9b255cd6ad2fe446a00220d25b34c11a848fc312291ccf9fc13ff302eb"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.17-darwin-arm64.tar.gz"
      sha256 "2cc4029a6ed43230d91acb8f95b00e39c73e0c18ce7678760523cfe397f25731"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.17-linux-x64.tar.gz"
    sha256 "a46f0c29420e182e7c0d7b6324b27559d52e0ff0d35a8a9f7841f5c78f55d4db"
  end
  version "2023.8.17"
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
