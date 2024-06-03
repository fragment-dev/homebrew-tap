require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.3-3-darwin-x64.tar.gz"
    sha256 "0ba26bc5e571195dac02f2f8af91879db9016cad824a83a8c9f4db0efd3ac383"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.3-3-darwin-arm64.tar.gz"
      sha256 "da935a4a7d416da2a7f32f6e80b23450e69a1710bb9942871c661ad14add0e85"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.3-3-linux-x64.tar.gz"
    sha256 "6a0c8003f69092fdbd3e56b8a2dcdaef6f81c78d35b67754990b3e22bda47a96"
  end
  version "2024.6.3-3"
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
