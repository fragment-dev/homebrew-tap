require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.3-2-darwin-x64.tar.gz"
    sha256 "352e3b252ce0cd6f7ebe9f705c4507b6913b393325916aa2fb822e405b9a3a43"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.3-2-darwin-arm64.tar.gz"
      sha256 "e548d5a3303715a1f0cb763eec83038f54c504f94d28bc722645aad95222ecdd"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.3-2-linux-x64.tar.gz"
    sha256 "61ac5c11138fdcfb48b6ac712a5e3ff2ad377efaec993db23259f8154cf9bfd6"
  end
  version "2024.6.3-2"
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
