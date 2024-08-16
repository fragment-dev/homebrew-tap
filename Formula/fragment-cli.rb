require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.16-1-darwin-x64.tar.gz"
    sha256 "1a9f6d425f468fc9424f8005c9d1f054058475c103eabad935cc6b84acc3f9d2"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.16-1-darwin-arm64.tar.gz"
      sha256 "0033b79572d94e0024b541363c76a8386b5f8a376bab1be8309f0ab1d0c7b573"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.16-1-linux-x64.tar.gz"
    sha256 "b4a117c34a7af9882e5f7afe704200bccca38cee481b659bfa7db2f6a50b8bb0"
  end
  version "2024.8.16-1"
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
