require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5167.0.0-darwin-x64.tar.gz"
    sha256 "8cce97edb0453cce673c1b4e51535060a7eb8ec6bea6e13556d72c157d4d5e6a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5167.0.0-darwin-arm64.tar.gz"
      sha256 "277b4885a85661e73e78d32eb0cdc37b5589c441739fc5fac19157e90c7cdad1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5167.0.0-linux-x64.tar.gz"
    sha256 "0d84c4937e89b73ea30cb967ae2dd5c4f4dc28ea8a558f28191fe9af85f45ebc"
  end
  version "5167.0.0"
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
