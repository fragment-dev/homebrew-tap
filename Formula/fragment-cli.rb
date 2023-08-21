require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.21-darwin-x64.tar.gz"
    sha256 "44d092cd71e36a1335195a21da732d90822a4f5717466dfe005d11ea659b4be1"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.21-darwin-arm64.tar.gz"
      sha256 "2f728219c6b693fbea6b7d57a6513bc34f97119d12b532a0a6e973173e0bf9b0"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.21-linux-x64.tar.gz"
    sha256 "29c3355ce80fa991c8639b7494ee65297c16a432b1c5b7c7473c17c7ecd2fa95"
  end
  version "2023.8.21"
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
