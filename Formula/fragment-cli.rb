require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.3-1-darwin-x64.tar.gz"
    sha256 "b80b21a8a70988ecfff36b3083c681a25754c6fb7b03b35162b0243309c6995c"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.3-1-darwin-arm64.tar.gz"
      sha256 "1c4ce9be01d40a672c19cd3fc0bf2ce5efc202aaf3158be89ee89ecb3d7a0b71"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.3-1-linux-x64.tar.gz"
    sha256 "a22c6407d4619f13bd1fc399cf976e6fda1ba11ab0afd17bab207820b512c2d5"
  end
  version "2024.7.3-1"
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
