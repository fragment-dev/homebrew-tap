require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5715.0.0-darwin-x64.tar.gz"
    sha256 "2b1070d3c9abb39f63a65ccaa52432c8238fc85eb020a0a3765ed411b96cf114"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5715.0.0-darwin-arm64.tar.gz"
      sha256 "f883c6b65356cf43c57bd67766730802e48537435723a0fff79c26d7641c17f9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5715.0.0-linux-x64.tar.gz"
    sha256 "45ded06b43a467fdfd878e63dadb7154a799c5c586c3cc5eb45df8580f95f407"
  end
  version "5715.0.0"
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
