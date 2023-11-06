require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.11.3-darwin-x64.tar.gz"
    sha256 "4824df7f07029255776f9a8dc997fd8c7c3f2469ec97eee922f3c7ceea887d3c"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.11.3-darwin-arm64.tar.gz"
      sha256 "deca39a51a57b49015e5caded655a581eaed1bf36194b786a0ec07c07871da94"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.11.3-linux-x64.tar.gz"
    sha256 "d69bb95d983c21c9e75c9ebef1cc0d65aafe01a201f93bc6c89edeb394997f7e"
  end
  version "2023.11.3"
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
