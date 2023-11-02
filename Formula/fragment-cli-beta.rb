require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3966.0.0-darwin-x64.tar.gz"
    sha256 "d4c2e02a80821d889ec94ff0c92e2f46b1f12848a20fca6fcdad765e15573321"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3966.0.0-darwin-arm64.tar.gz"
      sha256 "8f58936d35d622bd6a69466c9cb1848933ef82a5aba349803be2ad302cad93c8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3966.0.0-linux-x64.tar.gz"
    sha256 "e856f34892aa4d178fc0b8cf91f78773688ba07dcfa96a5fee0d20089175f3da"
  end
  version "3966.0.0"
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
