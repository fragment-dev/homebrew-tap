require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.12-darwin-x64.tar.gz"
    sha256 "605025e1cdb1195e1f61f7460703379644302401d1432f6cf0f6485afaa3cd64"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.12-darwin-arm64.tar.gz"
      sha256 "7a2af20971c02b3b522cdc1372f420cc6efa0938a56a40b24227109520e0c2d7"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.12-linux-x64.tar.gz"
    sha256 "ba1903e1ba7e8f037c55409929a94b7a3400721a179580c651c5c5a273d64d0a"
  end
  version "2023.5.12"
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
