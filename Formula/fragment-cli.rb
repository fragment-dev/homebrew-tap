require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.18-darwin-x64.tar.gz"
    sha256 "a9e8e6a4fa5a80f7198332b1b36b167a058e0ed1ba29df366c8bed2422175acc"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.18-darwin-arm64.tar.gz"
      sha256 "7b2aab6e96dc81c907d639547168005a378605eedf3970d399614ef248cc3c64"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.18-linux-x64.tar.gz"
    sha256 "05dee6b9770fb360025751067c24fc254a085def587b9ec29c2256e5c797d9d6"
  end
  version "2025.1.18"
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
