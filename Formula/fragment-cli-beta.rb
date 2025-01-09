require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6054.0.0-darwin-x64.tar.gz"
    sha256 "b0ce7dd89cbc191171b71ec887aa5745c26ce7af8d04be06895865bf74ea4b01"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6054.0.0-darwin-arm64.tar.gz"
      sha256 "386f657f46ab8dd24db70c9ec1afc9f3ea1dca7c171ca0f7b79577d738ba1db0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6054.0.0-linux-x64.tar.gz"
    sha256 "f2b64ff50fd934b00e99abf654db1055d95d5ba83fd5c23e1170b81db7410e9b"
  end
  version "6054.0.0"
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
