require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5851.0.0-darwin-x64.tar.gz"
    sha256 "2600e1d2e08331a7d492121d6223acddda65fe2c588cb61eef2301025e848c52"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5851.0.0-darwin-arm64.tar.gz"
      sha256 "aa0316d6e230687742f825e48bbf23dab0eb28982cd185964d632314302ed265"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5851.0.0-linux-x64.tar.gz"
    sha256 "731333bf6a0cc05f43a09168a25b9b237d08f1a21d58ffb5a8b0bede0ac27106"
  end
  version "5851.0.0"
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
