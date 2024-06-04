require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5186.0.0-darwin-x64.tar.gz"
    sha256 "fe5b622b8997f9f0bb708344736fa339d439dde8d769669187d9bf363980adfe"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5186.0.0-darwin-arm64.tar.gz"
      sha256 "34be22c61e8d239b63d46e93758d0ddb34867db2ca320b1fb1c120d4bfb99d59"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5186.0.0-linux-x64.tar.gz"
    sha256 "0f3db2ab64a212298fb6e30e3e81b46e8a9c22aa1dd8af0a1363b5e701af7b55"
  end
  version "5186.0.0"
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
