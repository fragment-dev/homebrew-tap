require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3445.0.0-darwin-x64.tar.gz"
    sha256 "5d11295871c2e5a3717528aa8555c0e741b3c5e191fc0dba741dc34646fb8b34"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3445.0.0-darwin-arm64.tar.gz"
      sha256 "7eae860be69e19b6a7231bd839f6d7c11228318b9e34ce5aa357a04f0100594b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3445.0.0-linux-x64.tar.gz"
    sha256 "3f82637d253df4635a0128b26b5cd53af5ed0d4447dbd96ea01391a090a60eb2"
  end
  version "3445.0.0"
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
