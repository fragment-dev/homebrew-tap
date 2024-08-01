require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5460.0.0-darwin-x64.tar.gz"
    sha256 "515a52dda30df2062eed377d4f9f5d28e8dbe0626d4d0f50c2b88d7b7ecbbea0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5460.0.0-darwin-arm64.tar.gz"
      sha256 "ca59c69cc1f62c9e7e8bb6b4b4f910d7e712fb56152af421735ebb04d060f37d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5460.0.0-linux-x64.tar.gz"
    sha256 "b57d24eb63a9234466ca86263fe3a89cbde36fb6cc1f21368913a711716e5ad8"
  end
  version "5460.0.0"
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
