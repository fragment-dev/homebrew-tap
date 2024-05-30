require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5151.0.0-darwin-x64.tar.gz"
    sha256 "33a5b414887e762f083253801069d3e9e551c8ff5088317f953995abb6200de3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5151.0.0-darwin-arm64.tar.gz"
      sha256 "6d20a33334bc62808d473efcde57109fe80e4d8df556ff4b8b1bb4b7e0237aa6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5151.0.0-linux-x64.tar.gz"
    sha256 "41c513d944a248de5da9de0c4fe6ca6a47af0b3767abcc94c82aa05664020ce0"
  end
  version "5151.0.0"
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
