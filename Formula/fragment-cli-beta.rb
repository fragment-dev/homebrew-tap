require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2531.0.0-darwin-x64.tar.gz"
    sha256 "39381b67c3805d5c7e30379cdb4a2d8c9d2f53431e231ffb850827f3c3ec0d4f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2531.0.0-darwin-arm64.tar.gz"
      sha256 "213b18715c17c665060d9d7bcc0c18949b7a0235a698bf8f5005a8df302c93b8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2531.0.0-linux-x64.tar.gz"
    sha256 "f15d44d7ecdbd6fab0ad817be5ba249e07a9be2e212afde332a896095123eea1"
  end
  version "2531.0.0"
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
