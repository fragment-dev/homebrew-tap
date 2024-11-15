require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5770.0.0-darwin-x64.tar.gz"
    sha256 "63c8456d4e28ff58e29c77b73f1d1452d2c1417f53139e691b96570fcf97e5c9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5770.0.0-darwin-arm64.tar.gz"
      sha256 "583dd9abbe05192a12e62c1c55be3fb23c4dd56497b0f225a35a5c30ec48c5d9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5770.0.0-linux-x64.tar.gz"
    sha256 "0ff11c4d6e6613121362f32fe9694e8bf6557093850dcc86224556874cb3040d"
  end
  version "5770.0.0"
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
