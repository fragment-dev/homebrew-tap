require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.11-darwin-x64.tar.gz"
    sha256 "084561ef67c66e54490cc7ea5c5b0d9355d99ffc64442d678d0ca6050aa92d03"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.11-darwin-arm64.tar.gz"
      sha256 "9d7653d0931c6b716d0327eb083f7958e00c71b7ad7316291c46ecde83ed822a"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.11-linux-x64.tar.gz"
    sha256 "7cb9353dea8a53e6dfe0abe8400dab29d90228329b23ba4b4fc9b391b09e3975"
  end
  version "2024.10.11"
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
