require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.11-darwin-x64.tar.gz"
    sha256 "368509812a7f28e85e823b47455ea54d4ad4fbe6d03b052f8813e025d83a574f"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.11-darwin-arm64.tar.gz"
      sha256 "0c25e80c2ccbf2b7afd6d37189a1abb56d7c7a71bd43f27cf0e131a7948e6bae"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.11-linux-x64.tar.gz"
    sha256 "9bebdc9e6303ea308acbcd6cd1adcbc423ce2e6af513cf951ca8385806a44242"
  end
  version "2023.7.11"
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
