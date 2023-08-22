require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.22-1-darwin-x64.tar.gz"
    sha256 "20116ed2170f2344c2aa1ce9b39079e11b9f6c1d28d152beefb4e1d317f130a1"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.22-1-darwin-arm64.tar.gz"
      sha256 "763587b8a103d4a29ace95fe2c3b947952d689894c1ae30892b34d4a211e1db0"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.22-1-linux-x64.tar.gz"
    sha256 "5246649745cf321cd136cb57d923e63ce56bf3e23cd23402540a9f9fa5babf72"
  end
  version "2023.8.22-1"
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
