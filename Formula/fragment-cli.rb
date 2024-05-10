require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.10-darwin-x64.tar.gz"
    sha256 "59ff7edd8fadafd3691e928024eff3a386e4ecdea823afad3e6bc25dd81cc78f"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.10-darwin-arm64.tar.gz"
      sha256 "ccbd56d0e8047db879b028af08439e92b6b6f9038eaa9b275ee2ea14c71fe0d4"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.10-linux-x64.tar.gz"
    sha256 "92ce9a8e94fd2c9cf71c9f08c99d55e3dff25b8f19acafdec2e3c420d45550d6"
  end
  version "2024.5.10"
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
