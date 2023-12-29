require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4235.0.0-darwin-x64.tar.gz"
    sha256 "e5ee6e453b7010a77f7aeda26bd31f456a3fd806d1f6370b7f6adf726dec907b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4235.0.0-darwin-arm64.tar.gz"
      sha256 "5bc226327810aa6aa6648a326d967ab39c4b82914ed5c60b55e24c3bbe08f9e1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4235.0.0-linux-x64.tar.gz"
    sha256 "84415e0bda28c3b059a3eaa7beea81404338abf2c247548ee11997e023b79e7c"
  end
  version "4235.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
