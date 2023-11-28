require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.11.28-darwin-x64.tar.gz"
    sha256 "188e9d399d937d9feb9275f70f64c695b3aafd7aabe017995ed09f3e14f2518d"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.11.28-darwin-arm64.tar.gz"
      sha256 "44d7f17d38aac1cb25bba635910a64b6e3433ab2c3719c35f6254a8de4ab663e"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.11.28-linux-x64.tar.gz"
    sha256 "ab6aa29532b85f160a6c320e90732fd4ba110c0d31d46a3e06373f078ddf4536"
  end
  version "2023.11.28"
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
