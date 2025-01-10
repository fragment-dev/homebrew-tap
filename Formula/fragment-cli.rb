require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.10-1-darwin-x64.tar.gz"
    sha256 "d6c839264467add623898b94bd0bd2f6d026c577b1739608c5ffea479bd3460d"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.10-1-darwin-arm64.tar.gz"
      sha256 "55dceca9f8ba533e836e253dd40edc7f9f8325483a99ea72fc136e59b712596b"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.10-1-linux-x64.tar.gz"
    sha256 "c79d0b9de8203dd51de51d84efe3672fa9a8e131acc5d0d5feacd3a651849e5b"
  end
  version "2025.1.10-1"
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
