require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3093.0.0-darwin-x64.tar.gz"
    sha256 "8040b5fa7cda39995f51306493a0d366f2ff962374138e529195880016a969e6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3093.0.0-darwin-arm64.tar.gz"
      sha256 "809511a68377355f341354c6a10966a4c266d9b2537a674b86df781be64ccafc"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3093.0.0-linux-x64.tar.gz"
    sha256 "c49205cb655bc6bef8a035c042cf6f9cad95829875cb3df2eba7d6f65b0ac14b"
  end
  version "3093.0.0"
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
