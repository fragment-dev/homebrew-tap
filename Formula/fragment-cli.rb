require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.5-2-darwin-x64.tar.gz"
    sha256 "49481debfd1c6d979f0c3b6bbd4d490dfc39f441c55002ca989fd6931d93648f"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.5-2-darwin-arm64.tar.gz"
      sha256 "275accfb00718560f0262a28ac3012900f6e1a9ae00d2943d3e785a983799a3c"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.5-2-linux-x64.tar.gz"
    sha256 "b3be071e0d6d382ce9e46b3488affba199e8d0a871998a5f21fc24874dafa2e9"
  end
  version "2024.6.5-2"
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
