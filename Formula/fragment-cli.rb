require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.13-2-darwin-x64.tar.gz"
    sha256 "bc45ef79390801996c035f657b49e3e55a5e8aa614f4386c424104648f848436"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.13-2-darwin-arm64.tar.gz"
      sha256 "488aeb1e0cdea804d9f6280bdcf1be887bc94d8756530baf84112f532cf350e7"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.13-2-linux-x64.tar.gz"
    sha256 "d3a4bb97193adc0efc27afad7cb1c86450d1aa9b34f2d45c01492bef9c7850cf"
  end
  version "2023.7.13-2"
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
