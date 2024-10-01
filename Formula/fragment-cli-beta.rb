require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5634.0.0-darwin-x64.tar.gz"
    sha256 "a5f7430340b001487e181a4672101a272108e9f85750ff1e56a51f04a8597954"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5634.0.0-darwin-arm64.tar.gz"
      sha256 "4e2845dad5b994aa9e8d86dda30c45d5d4785bf3cd35bee3d0b274ff41277aee"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5634.0.0-linux-x64.tar.gz"
    sha256 "d8a266200871c87edafbd168f928436d9f71f19a3cecbfc98de75455f3d01ad6"
  end
  version "5634.0.0"
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
