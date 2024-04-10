require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.10-2-darwin-x64.tar.gz"
    sha256 "f24d7f7a2429823030e0fbc7676620bf740ea7f5d2fa8c5c3529cc069de74e0d"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.10-2-darwin-arm64.tar.gz"
      sha256 "65ff49026e2fc9a3311d21505bcf72df2aaaf9cd79e8672ec0c52ed0117501c0"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.10-2-linux-x64.tar.gz"
    sha256 "b435ad24196b57154cf8aeb0f96ef5929b246931f9250b7fe268519169275534"
  end
  version "2024.4.10-2"
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
