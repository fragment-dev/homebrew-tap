require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.25-1-darwin-x64.tar.gz"
    sha256 "fc24d15aec7e2cd3b9fe1a3806ca6f5dfd1a9124f8b0fd8213e1ed275ff7c205"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.25-1-darwin-arm64.tar.gz"
      sha256 "5cca3e4274926befc19e0d4aa9e6d09ef74842a7aa19ebe35f285e3a1fa39425"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.25-1-linux-x64.tar.gz"
    sha256 "a7194db03039f51f6c7bf7520d8608d37ed9768d945349cff5dd5e7cdd3e7491"
  end
  version "2024.1.25-1"
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
