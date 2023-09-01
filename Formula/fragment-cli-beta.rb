require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3461.0.0-darwin-x64.tar.gz"
    sha256 "5bae982bfa11f584fca0db41d5ad3bb50e31387c48fa26f575b9df13881e39ff"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3461.0.0-darwin-arm64.tar.gz"
      sha256 "c8fb29093f7353606136a7075f0430afd73c14f80ecf063fa71040a42cf1c9fe"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3461.0.0-linux-x64.tar.gz"
    sha256 "de13d918a1b0d12263932cefd5f271c2580e314eb9b195b8731c420b28f5ce79"
  end
  version "3461.0.0"
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
