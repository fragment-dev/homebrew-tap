require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.30-darwin-x64.tar.gz"
    sha256 "8e1481663296f11da59dd320c42c1abf4ed3f17ea49bb85359b162e06d9ff79d"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.30-darwin-arm64.tar.gz"
      sha256 "10e85127ff9e4b3c76a690e28507a07afc3033facea3ba09c7a45769054c3cd3"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.30-linux-x64.tar.gz"
    sha256 "d5208c8b61942d2223da629223c92ab3107578aa1a2e0e47abf1921ff2f6cc97"
  end
  version "2024.10.30"
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
