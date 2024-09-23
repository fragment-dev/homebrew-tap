require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5616.0.0-darwin-x64.tar.gz"
    sha256 "68f8a1d59d9efa3a5791ca01658c95187b995191852b8eed1402957ad301024d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5616.0.0-darwin-arm64.tar.gz"
      sha256 "2bd40a2dc95d60cec06ca0456b52d3061d9511aaea6fd384fc6ee6cd4dbbea1f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5616.0.0-linux-x64.tar.gz"
    sha256 "c7ffe598dc61fce759d52c047502eac81e098dfb9a456eb38e9d067956a86cf9"
  end
  version "5616.0.0"
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
