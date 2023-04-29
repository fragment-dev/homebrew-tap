require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2552.0.0-darwin-x64.tar.gz"
    sha256 "6b768d4ba5342ed970bac8cc6b359a157e0abda463b75145bbef915103322f3b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2552.0.0-darwin-arm64.tar.gz"
      sha256 "f4d0a38ee19e0d0b8de4b91d9a46959693996118a69557c321ce1371bd8acb72"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2552.0.0-linux-x64.tar.gz"
    sha256 "988612a794d869a839c7b6a227d4ee1ca53f708db13f01a79266e86374e72ee4"
  end
  version "2552.0.0"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
