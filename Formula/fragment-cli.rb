require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.15-darwin-x64.tar.gz"
    sha256 "f1e2ef96d1096065d483c60c47d0b478acebc6d74dc5307b70e799d91693ca73"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.15-darwin-arm64.tar.gz"
      sha256 "d7becaee9cc098d17065a98d4a9e85ffd7e1f5e8731faf53eb8fb1a9d2978ad1"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.15-linux-x64.tar.gz"
    sha256 "82c24eebfe2a4fd64f382f260634386b76ebcd1ab6fb0fc6798b6d50a53dfc67"
  end
  version "2024.4.15"
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
