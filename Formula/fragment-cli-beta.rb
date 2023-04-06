require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2369.0.0-darwin-x64.tar.gz"
    sha256 "a39eee5eee2de3a38cc01f1eae5f7d3f56ae2c7da93160438630fb5240b75694"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2369.0.0-darwin-arm64.tar.gz"
      sha256 "925f01bdca96c8ec1c351dcc1a6ab2f46b716a430c5e0350c654f20db9f884db"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2369.0.0-linux-x64.tar.gz"
    sha256 "976d58473c82543c23a199cb0200e272fcd14d24343a90f5c4efd862c8cbe0bd"
  end
  version "2369.0.0"
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
