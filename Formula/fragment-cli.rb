require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.13-2-darwin-x64.tar.gz"
    sha256 "fd53a08fda307311c374125336df7fbc766fc5b5a88b5dbbde703298601902bd"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.13-2-darwin-arm64.tar.gz"
      sha256 "5b5086846f353acd26474290bfd2244bafcf3e6c136c2e830bdb167a28999767"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.13-2-linux-x64.tar.gz"
    sha256 "f00ac90747b27240a0374699ecb61c8a1c1b5886705f691dd62c3c1446032e28"
  end
  version "2023.6.13-2"
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
