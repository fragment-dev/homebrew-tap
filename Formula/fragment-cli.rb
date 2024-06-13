require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.13-1-darwin-x64.tar.gz"
    sha256 "1a6320bad02d3cad0ee4ed1aa4305c0f2d503537b45e921397803a1849be3e0e"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.13-1-darwin-arm64.tar.gz"
      sha256 "af8ae619d9fa120a86e6469d030826c1b292860158d86726e46485dd47e34820"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.13-1-linux-x64.tar.gz"
    sha256 "1a940efcf4f98c53bf89611d80943896bf2262e054bef872ba2e67f8324d0f8e"
  end
  version "2024.6.13-1"
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
