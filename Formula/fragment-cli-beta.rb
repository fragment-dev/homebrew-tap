require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2578.0.0-darwin-x64.tar.gz"
    sha256 "9672ddac0e88266d58139896640a41f0c690d90e3a74ebdedd1964f45f94461b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2578.0.0-darwin-arm64.tar.gz"
      sha256 "2abe0c16e9ce6a94f61b5f0041619624ff0f34b0fde8f96c117cf9fcd3cd1690"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2578.0.0-linux-x64.tar.gz"
    sha256 "8694ae353fe3436419ba4c0960b83a636ac85dcd0058c12210e4f9a6006a3e58"
  end
  version "2578.0.0"
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
