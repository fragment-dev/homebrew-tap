require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2491.0.0-darwin-x64.tar.gz"
    sha256 "710fba3089e48c57e3209773bd9bb0db908bb5bfa956360a767f4a3fa88475f7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2491.0.0-darwin-arm64.tar.gz"
      sha256 "d5d793323524c56910c39b99ca1116421e6655e52eb8dae88cefc9a689fc04af"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2491.0.0-linux-x64.tar.gz"
    sha256 "9898a3ec078a728b8027c5414eae2c32c0acd78303cd636a3cd25ac3dda4bf3e"
  end
  version "2491.0.0"
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
