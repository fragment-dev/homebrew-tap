require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5377.0.0-darwin-x64.tar.gz"
    sha256 "f233c99f6b85f4b49fd67aa025915dd08d19bd39d54dc9710e07eb7aaa5ab890"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5377.0.0-darwin-arm64.tar.gz"
      sha256 "bbb96fd04704ec10c993fa346fffc5f6465516fc64dde4f330d561711d499bf8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5377.0.0-linux-x64.tar.gz"
    sha256 "88055f3dcb37400f5cd3af3eab8195ee31eff46242ef4606b8b872ba2c4dcc49"
  end
  version "5377.0.0"
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
