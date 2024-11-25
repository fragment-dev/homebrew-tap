require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5830.0.0-darwin-x64.tar.gz"
    sha256 "50edc2caa0fd60d36bca50a25883234fe9391beb2f1854d98c31d510cc9fdbc1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5830.0.0-darwin-arm64.tar.gz"
      sha256 "e9e54c67d7569f67b87c4f8a2bf2dbf9a71cafa4e52f4d52d0b60cf7df1243c7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5830.0.0-linux-x64.tar.gz"
    sha256 "28055c435dca17de0ec02d8e52bea066b3c03c561ef6f4134a8fdbe07444cae0"
  end
  version "5830.0.0"
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
