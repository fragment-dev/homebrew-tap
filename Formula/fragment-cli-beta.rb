require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4899.0.0-darwin-x64.tar.gz"
    sha256 "f1f684696021042760a40f4edb37ed23962e9753aca13bb4d3aa466249456497"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4899.0.0-darwin-arm64.tar.gz"
      sha256 "d5bd4f9662518cf9b2dbf3cac2e437cee6eb15a1164f755ed02dabf07b1c889a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4899.0.0-linux-x64.tar.gz"
    sha256 "68b641517b2cb4f40c1a980c5c60b4b551e9dc78cc62ccad8075141566559dec"
  end
  version "4899.0.0"
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
