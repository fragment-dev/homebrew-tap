require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.1-1-darwin-x64.tar.gz"
    sha256 "577b83ce38b85ac64c74592986c148663b002cbb5b74b64a66b9daf35fb5382c"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.1-1-darwin-arm64.tar.gz"
      sha256 "8f6f7c81c7a8bd2e2d3045c3d3aecd285f5a4c5640cddde8d62517e22dcadefc"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.1-1-linux-x64.tar.gz"
    sha256 "9da8906b38bbc54d88c8bff3b7a0490caf3b187aba0a82a177ee616ababdd995"
  end
  version "2023.9.1-1"
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
