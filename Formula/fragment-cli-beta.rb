require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5620.0.0-darwin-x64.tar.gz"
    sha256 "f46ac4f1c548abeeb382f300d096b0b8908608ee6dc2ac2f20ecfe4f0b65bdc2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5620.0.0-darwin-arm64.tar.gz"
      sha256 "ef4690e54822b207ff3426b8922cd47b788d84074ae2a1121fcb4cb1c8d93b16"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5620.0.0-linux-x64.tar.gz"
    sha256 "712ecd1d68252dacb76378a144c940185e933791cf8360d3fbb14f2e8af5cfff"
  end
  version "5620.0.0"
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
