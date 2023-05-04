require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.4-darwin-x64.tar.gz"
    sha256 "45973fdef90c3592039d9d7243a7f5b37e5d7b9e8e4d22322bc886776005d048"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.4-darwin-arm64.tar.gz"
      sha256 "62c3b4b218305286543e0064880614cbe0f7d4c2043feb26b310f378e53ee704"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.4-linux-x64.tar.gz"
    sha256 "e3d35f8cdbad09339d4babf4132619753dbb8058a9ca0db1a40358db7b757fba"
  end
  version "2023.5.4"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
