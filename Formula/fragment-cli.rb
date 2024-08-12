require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.12-darwin-x64.tar.gz"
    sha256 "5425a92700c65f8c913d07d18e1e3274477f7f213a6d4734ce5de2f0e64292e1"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.12-darwin-arm64.tar.gz"
      sha256 "2c6d907f5f0686f13266fdd6213408e2058c0142074eb4b31a6479d9efcf4c04"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.12-linux-x64.tar.gz"
    sha256 "d3f0aaaa35c7f0d850cd84cf9330631278d5d504f8d31ec0666b8578bbd9b662"
  end
  version "2024.8.12"
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
