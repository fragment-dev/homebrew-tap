require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.2-1-darwin-x64.tar.gz"
    sha256 "c4c3751a1383d1c2509ae666c5e27c3e885a64957b0755317f0dbd2a0868bb0d"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.2-1-darwin-arm64.tar.gz"
      sha256 "44386d54c9d14f4b87c703b86628e57a2cde000a4d4dcb8664ee8742ea591eea"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.2-1-linux-x64.tar.gz"
    sha256 "b59108614b35997431e9e16292f25cf072ac8e66c03d375844ddd3da1313be06"
  end
  version "2025.1.2-1"
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
