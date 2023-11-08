require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3986.0.0-darwin-x64.tar.gz"
    sha256 "c5927d7b7ead8dc81f71f455a4fd0cd3431489cbccbc06cf4fe90a9b9a4a407b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3986.0.0-darwin-arm64.tar.gz"
      sha256 "a50bc20d7c018147587cebf445f488ec088c963175a6a431bf42f4d8396f04ca"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3986.0.0-linux-x64.tar.gz"
    sha256 "fc9d517c4d928a5c31e6e15ddad63d548ab2842bcfef7a31510a5d7f13624a07"
  end
  version "3986.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
