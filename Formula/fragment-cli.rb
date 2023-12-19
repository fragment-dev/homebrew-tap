require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.18-darwin-x64.tar.gz"
    sha256 "f5734f6370319ae385918c533960955f99fbedcc060c9af32b23751da890f335"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.18-darwin-arm64.tar.gz"
      sha256 "a2bd078f90858b9d64b611b1efe8b953bb9f65b0b5efb365512aa5457fa94f6d"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.18-linux-x64.tar.gz"
    sha256 "90005453995edc6aa78460183bab57d6ac854f64e9d053ca7427cc2e92b79027"
  end
  version "2023.12.18"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
