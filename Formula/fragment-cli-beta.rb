require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2328.0.0-darwin-x64.tar.gz"
    sha256 "8aba64ffe7ac098c3d4ae5ba2cd9efbdb579fe267b1f219119daec8dfa98fe15"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2328.0.0-darwin-arm64.tar.gz"
      sha256 "b4b32864158ca3885d01d0b1db6654b8e48f53539ad281a83fd1caebc949f75b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2328.0.0-linux-x64.tar.gz"
    sha256 "637acec89706b191581b167287502c142bf909e2c5c7e25e4c90b280ff9a48d4"
  end
  version "2328.0.0"
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
