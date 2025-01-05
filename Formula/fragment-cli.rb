require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.3-2-darwin-x64.tar.gz"
    sha256 "3931ba54833769353142a593f90d7c93c1dcf408d8cf818d377884e653cb2fb7"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.3-2-darwin-arm64.tar.gz"
      sha256 "4d6716d9fb5dce7b38bc99e6c16335ba3487e20ad28dbeb52ee7b781ad5bfbcf"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.3-2-linux-x64.tar.gz"
    sha256 "29e8c4b2edae91cbd52972d8554b146ae3960ed3cb474fdcb5b112b08be431c2"
  end
  version "2025.1.3-2"
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
