require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.16-darwin-x64.tar.gz"
    sha256 "862dc689c8457da8b1f334ed33f093cbfb928dfa137c558911ed7ee1fa8c6c31"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.16-darwin-arm64.tar.gz"
      sha256 "adf03676d2b87d84b1898957bcc7faa709897f895f789bd4f7a793291220846f"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.16-linux-x64.tar.gz"
    sha256 "43fc2691442f972090b3cfee942a35f3c9bfd2788e639ee1dac3afef4a8b7857"
  end
  version "2024.2.16"
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
