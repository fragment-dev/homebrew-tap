require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6100.0.0-darwin-x64.tar.gz"
    sha256 "b33c4922f9fa266baa5afef5f4a3147c0ef7f9c49240a34ec31d9b4e4cee2b79"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6100.0.0-darwin-arm64.tar.gz"
      sha256 "8296618074b6608e3b13feeb43a95208c992ce31e0b4be6d9bdbeca4b022766e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6100.0.0-linux-x64.tar.gz"
    sha256 "8a574b2d13ef956b708f510528fc8fc2e4cfb3cda9e5c1158205ca359ce0be5d"
  end
  version "6100.0.0"
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
