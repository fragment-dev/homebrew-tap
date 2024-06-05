require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.5-darwin-x64.tar.gz"
    sha256 "b230d3e5bccb9e2032e363efb9fcf0f86b12daf6d489ff7e74b92aefcd20f2bd"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.5-darwin-arm64.tar.gz"
      sha256 "3d33b881a422b3d23b77c800befaa0c20b923b391a80f8ee55964ad08b8e9c7b"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.5-linux-x64.tar.gz"
    sha256 "0c7bee71c885c8736e356e6cb338d3c62ebc727f20f96bec7747ac3f538678a1"
  end
  version "2024.6.5"
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
