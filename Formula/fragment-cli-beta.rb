require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5414.0.0-darwin-x64.tar.gz"
    sha256 "4cfa081b822f7f4261313a6b0d31f11ef0989ee83ba5da1ca1018894d63e4a96"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5414.0.0-darwin-arm64.tar.gz"
      sha256 "c730f32ccfc895e2cde871e5c95bca1c47f34c4bf2312c32a051080033578381"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5414.0.0-linux-x64.tar.gz"
    sha256 "f1f52928ee000691caa76e0fc384fb22dcc9642cbaba5923002cd1243afa7df5"
  end
  version "5414.0.0"
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
