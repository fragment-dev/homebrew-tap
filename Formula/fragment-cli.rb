require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.10-1-darwin-x64.tar.gz"
    sha256 "3afedd4fae0e6617c2514f4c004dfeb407bf0168405b42802b8a1d208bcdd378"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.10-1-darwin-arm64.tar.gz"
      sha256 "9b51ff4d4f27c46b96dbe9685290d2dcb21a36a2f9f80cf8af4d8f8c63d9ae7a"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.10-1-linux-x64.tar.gz"
    sha256 "bc6915d9a64b146321c4605497c4706b9ff1e12604693ea209da27dd763c0a29"
  end
  version "2024.4.10-1"
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
