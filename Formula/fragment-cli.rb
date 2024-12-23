require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.23-1-darwin-x64.tar.gz"
    sha256 "0795df2ad46953860307f2ec47694249c66ded69a1f8a832fccdfc9a7f47e97a"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.23-1-darwin-arm64.tar.gz"
      sha256 "50d4221cd25ff12ba5f89638cd6000c078df26430526809b4e18cfd18a8ed969"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.23-1-linux-x64.tar.gz"
    sha256 "37b81bd940c1f471bc0aecd72aa3ab2d17538e38b8adc198a842db9a2f61f0c3"
  end
  version "2024.12.23-1"
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
