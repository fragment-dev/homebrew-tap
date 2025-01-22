require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.22-2-darwin-x64.tar.gz"
    sha256 "9963e210ebb20d8e4c35bc8d89819c1035bcf373596980dd013b528f2ec2b726"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.22-2-darwin-arm64.tar.gz"
      sha256 "dae8eca4f226741655347843bdfeec66fa0f5d3a1adab45fbd97f29694948e20"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.22-2-linux-x64.tar.gz"
    sha256 "27745dfdc9c9d08340f3fe3a1e044c09900d3bf4ebfa99a51052cb3cca9881e4"
  end
  version "2025.1.22-2"
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
