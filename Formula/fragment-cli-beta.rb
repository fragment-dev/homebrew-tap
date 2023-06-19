require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2872.0.0-darwin-x64.tar.gz"
    sha256 "b9e8dc72fb4e00a8ea8bb4dd0ba036b10062794c9d9d9fad90e075d7ae1bd53a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2872.0.0-darwin-arm64.tar.gz"
      sha256 "92a7b4fa4c9021fb2725f97c89f812e882e5c6cc08f393d6e5a97865c4c6a8d1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2872.0.0-linux-x64.tar.gz"
    sha256 "33de226885d4d5b519d40d1422f03e663b9c431d3112cb5fded9c24ee825eea9"
  end
  version "2872.0.0"
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
