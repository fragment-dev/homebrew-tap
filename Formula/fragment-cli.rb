require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.25-1-darwin-x64.tar.gz"
    sha256 "0b13a009fb4d25781576f70aa00e13aff7b284d8486d5c4fa8efdf3937f14aea"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.25-1-darwin-arm64.tar.gz"
      sha256 "2c03c132295712f5cbda49e0f5cb935044c422d2fc3c7158689a904bd626dc15"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.25-1-linux-x64.tar.gz"
    sha256 "4f8fa92a8ec2e6871df48921fbafdd2f6aa1ab2a017e645badc7e0117c6e8a68"
  end
  version "2024.3.25-1"
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
