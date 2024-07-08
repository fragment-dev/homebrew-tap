require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5361.0.0-darwin-x64.tar.gz"
    sha256 "04b9b7cb9328ac2e406dc89d5c36e73d81dee4c1059f3a314a526288b5f17e0f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5361.0.0-darwin-arm64.tar.gz"
      sha256 "8246608c9bf3fd517ececd955947c2d1dd67388d6ffbcc6e780599d737c68ab7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5361.0.0-linux-x64.tar.gz"
    sha256 "e2a195f5b2cb9bdeb1bbaa11d61ff471796e099e526900696d6c07e182de3977"
  end
  version "5361.0.0"
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
