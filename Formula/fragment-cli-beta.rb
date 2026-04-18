require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v8347.0.0-darwin-x64.tar.gz"
    sha256 "da90ffb776f02c8c88318b15bc9e7f47a3eb885c49ca3209d94ec7631a03ccb9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v8347.0.0-darwin-arm64.tar.gz"
      sha256 "3b0d9cbb44a3eacdf200de8c49ce70c86576656b4bde4b037278f5484f613439"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v8347.0.0-linux-x64.tar.gz"
    sha256 "38808f39deb3b6c535bea8defe84f1dcb46d248801d5afa5e9bd4fdf32920359"
  end
  version "8347.0.0"
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
