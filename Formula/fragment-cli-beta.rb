require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4965.0.0-darwin-x64.tar.gz"
    sha256 "873941ebecf998a97838633d19d069fea8480858cba935c7c04f231a93496e11"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4965.0.0-darwin-arm64.tar.gz"
      sha256 "aaf09784e0881a176da797b14dc4ddacedf29a27ad6aaa25240b46a47bf6b4fd"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4965.0.0-linux-x64.tar.gz"
    sha256 "3f219d7b1f68acf734235a3000dc306f5a3c837f8c82b32859ca3a562179fd4d"
  end
  version "4965.0.0"
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
