require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2864.0.0-darwin-x64.tar.gz"
    sha256 "30c4b8444b627cdee8a6831cc5b70a31f51bc5e9e55bd80bef3d99dd7deb66be"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2864.0.0-darwin-arm64.tar.gz"
      sha256 "25c13c93de043c7a5cf621eaf52b7ea18f5417d24a945fb25e5861780efd38dd"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2864.0.0-linux-x64.tar.gz"
    sha256 "81a1707795672dadb41daa5074e7cf3158783e8de443b9d941525a8b5ad34a15"
  end
  version "2864.0.0"
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
