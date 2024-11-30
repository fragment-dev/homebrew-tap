require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5842.0.0-darwin-x64.tar.gz"
    sha256 "a63da7c1554b1ff48a9169940710b26db9e629a8664cbff8ce1123510f215d9c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5842.0.0-darwin-arm64.tar.gz"
      sha256 "0f27f0e3624e124d31c28125fa453c032df3db352158bb89e51ebb1f2f1de972"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5842.0.0-linux-x64.tar.gz"
    sha256 "d5e188ba84a797bf8ed96e94e8c16716f7ad1446403ab4ace94d6add374873c2"
  end
  version "5842.0.0"
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
