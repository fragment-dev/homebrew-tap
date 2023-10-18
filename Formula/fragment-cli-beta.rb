require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3866.0.0-darwin-x64.tar.gz"
    sha256 "7d7c333afdc8d0cdc62a8f651f2cd369539174be068cebb60ea095cee54e1978"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3866.0.0-darwin-arm64.tar.gz"
      sha256 "8ce0cba3ba6625c8d51a0555bdefb4ceb219e9af3eae29d7dfa25b3aa7561776"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3866.0.0-linux-x64.tar.gz"
    sha256 "af82b66cb3e6df39f1e120e9d19305ed3b503cc81956622fd17921f973cad156"
  end
  version "3866.0.0"
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
