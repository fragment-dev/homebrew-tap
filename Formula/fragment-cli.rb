require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.18-darwin-x64.tar.gz"
    sha256 "fd9b40d6307d75c6a06d93bac1d02bc94f320564215800d12df4486a3f2e6770"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.18-darwin-arm64.tar.gz"
      sha256 "9258ad87a8ae88c7b3f4375231d29af95d796d07eee8097f8c68ddfa4243fb6f"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.18-linux-x64.tar.gz"
    sha256 "5875be0c6d6f5bf69f8c00de24deeab4bb193023b585778be0ce2418b740136c"
  end
  version "2024.3.18"
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
