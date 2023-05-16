require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2677.0.0-darwin-x64.tar.gz"
    sha256 "0cb1d0f1689cf1bf908b8604bfec410cc923efa27693b9ec5b74105c69e49014"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2677.0.0-darwin-arm64.tar.gz"
      sha256 "1379ffc02ac5b7cb00a94c60f3e3e1be54c8467a9352a57c8eff1da6da2f296d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2677.0.0-linux-x64.tar.gz"
    sha256 "b3eda0ccfcf26bfed21a610f8d7f5df9a7ae2817b1b91b21267352b5f6a42040"
  end
  version "2677.0.0"
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
