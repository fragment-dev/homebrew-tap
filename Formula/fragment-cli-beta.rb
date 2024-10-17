require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5674.0.0-darwin-x64.tar.gz"
    sha256 "302cce176c4596fd52122a1f6ff66ae542bb59d7b325fcd854aabbf0fe10231d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5674.0.0-darwin-arm64.tar.gz"
      sha256 "ff56a6bc80c235c51ffa549004d6eae785769ee0733bb58cf82db6010388b40c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5674.0.0-linux-x64.tar.gz"
    sha256 "25f8a4037f633fe4b5a19fd288ba7c700fdea09e303186aab59bfd3de6a4b465"
  end
  version "5674.0.0"
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
