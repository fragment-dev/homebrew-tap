require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5920.0.0-darwin-x64.tar.gz"
    sha256 "5c5b8ed996a4a1d4687d293dc7426a4b8a02a2a54ea27d78726ca70f54678bf8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5920.0.0-darwin-arm64.tar.gz"
      sha256 "c8eb5f3a5507e7303cf72821b2d168738e79869c9e503c0ef3a2aaa609f6ffcf"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5920.0.0-linux-x64.tar.gz"
    sha256 "463c5537d860671480aba1d5a5bd058ebd67e55f1ad3d97a4755f81ef9168120"
  end
  version "5920.0.0"
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
